/*
 * *****************************************************************
 * File: top_zynqberry.v
 * Category: sources_1
 * File Created: 2019/10/07 21:53
 * Author: kidtak51 ( 45393331+kidtak51@users.noreply.github.com )
 * *****
 * Last Modified: 2019/10/08 21:25
 * Modified By: kidtak51 ( 45393331+kidtak51@users.noreply.github.com )
 * *****
 * Copyright 2018 - 2019  Project RockWave
 * *****************************************************************
 * Description:
 *   
 * *****************************************************************
 * HISTORY:
 * Date      	By        	Comments
 * ----------	----------	----------------------------------------
 * 2019/10/07	kidtak51	First Version
 * *****************************************************************
 */
module top_zynqberry(
    inout [14:0]    DR_addr         ,
    inout [2:0]    DDR_ba           ,
    inout [0:0]    DDR_cas_n        ,
    inout [0:0]    DDR_ck_n         ,
    inout [0:0]    DDR_ck_p         ,
    inout [0:0]    DDR_cke          ,
    inout [0:0]    DDR_cs_n         ,
    inout [1:0]    DDR_dm           ,
    inout [15:0]    DDR_dq          ,
    inout [1:0]    DDR_dqs_n        ,
    inout [1:0]    DDR_dqs_p        ,
    inout [0:0]    DDR_odt          ,
    inout [0:0]    DDR_ras_n        ,
    inout [0:0]    DDR_reset_n      ,
    inout [0:0]    DDR_we_n         ,
    inout [0:0]    FIXED_IO_ddr_vrn ,
    inout [0:0]    FIXED_IO_ddr_vrp ,
    inout [31:0]    FIXED_IO_mio    ,
    inout [0:0]    FIXED_IO_ps_clk  ,
    inout [0:0]    FIXED_IO_ps_porb ,
    inout [0:0]    FIXED_IO_ps_srstb,
    inout [23:0]    GPIO_1_tri_io   ,
    output[0:0]    PWM_L            ,
    output[0:0]    PWM_R            ,
    input [0:0]    Vp_Vn_v_n        ,
    input [0:0]    Vp_Vn_v_p        ,
    input [0:0]    csi_c_clk_n      ,
    input [0:0]    csi_c_clk_p      ,
    input [0:0]    csi_d_lp_n       ,
    input [0:0]    csi_d_lp_p       ,
    input [1:0]    csi_d_n          ,
    input [1:0]    csi_d_p          ,
    output[0:0]    hdmi_clk_n       ,
    output[0:0]    hdmi_clk_p       ,
    output[2:0]    hdmi_data_n      ,
    output[2:0]    hdmi_data_p      ,
    output[0:0]    led_op           ,
    input [0:0]    ps_clk           
);

wire clk_out1;
wire clk_out2;
clk_wiz_0 u_clk_wiz_0(
  .clk_out1(clk_out1),
  .clk_out2(clk_out2),
  .reset(1'b0),
  .locked(locked),
  .clk_in1(ps_clk)
 );


led_ctrl u_Led_Chika(
      .clk_ip(clk_out1),
      .led_op(led_op),
      .interval_ip(32'h01FFFFFF)
    );

assign GPIO_1_tri_io[0] = 1'bz;
assign GPIO_1_tri_io[1] = 1'bz;
assign GPIO_1_tri_io[2] = 1'bz;
assign GPIO_1_tri_io[3] = 1'bz;
assign GPIO_1_tri_io[4] = 1'bz;
assign GPIO_1_tri_io[5] = 1'bz;
assign GPIO_1_tri_io[6] = 1'bz;
assign GPIO_1_tri_io[7] = 1'bz;
assign GPIO_1_tri_io[8] = 1'bz;
assign GPIO_1_tri_io[9] = 1'bz;
assign GPIO_1_tri_io[10] = 1'bz;
assign GPIO_1_tri_io[11] = 1'bz;
assign GPIO_1_tri_io[12] = 1'bz;
assign GPIO_1_tri_io[13] = 1'bz;
assign GPIO_1_tri_io[14] = 1'bz;
assign GPIO_1_tri_io[15] = 1'bz;//
assign GPIO_1_tri_io[16] = 1'bz;
assign GPIO_1_tri_io[17] = 1'bz;
assign GPIO_1_tri_io[18] = 1'bz;
assign GPIO_1_tri_io[19] = 1'bz;
assign GPIO_1_tri_io[20] = 1'bz;
assign GPIO_1_tri_io[21] = 1'bz;
assign GPIO_1_tri_io[22] = 1'bz;
assign GPIO_1_tri_io[23] = 1'bz;//

reg[23:0] data;
reg h_sync;
reg v_sync;
reg h_valid;
reg v_valid;

rgb2dvi u_rgb2dvi(
    .TMDS_Clk_p(hdmi_clk_p),
    .TMDS_Clk_n(hdmi_clk_n),
    .TMDS_Data_p(hdmi_data_p),
    .TMDS_Data_n(hdmi_data_n),
    .aRst(1'b0),
    .aRst_n(1'b1),
    .vid_pData(data),
    .vid_pVDE(h_valid && v_valid),
    .vid_pHSync(h_sync),
    .vid_pVSync(v_sync),
    .PixelClk(clk_out1),
    .SerialClk(clk_out2)//do not use
);

//assign led_op = v_sync;

reg[31:0] h_cnt = 0;
reg[31:0] v_cnt = 0;


always @(posedge clk_out1) begin
    if(h_cnt > 'd1650) begin
        h_cnt = 'd0;
        if(v_cnt > 'd750) begin
            v_cnt = 'd0;
        end
        else begin
            v_cnt = v_cnt + 1'b1;
        end
    end
    else begin
        h_cnt = h_cnt + 'd1;
    end
end
always @(posedge clk_out1) begin
    if('d110 <= h_cnt && h_cnt < ('d110 + 'd40)) begin
        h_sync = 1'b1;
    end
    else begin
        h_sync = 1'b0;
    end
end
always @(posedge clk_out1) begin
    if('d370 <= h_cnt && h_cnt < ('d370 + 'd1280)) begin
        h_valid = 1'b1;
    end
    else begin
        h_valid = 1'b0;
    end
end

always @(posedge clk_out1) begin
    if('d5 <= v_cnt && v_cnt < ('d5 + 'd5)) begin
        v_sync = 1'b1;
    end
    else begin
        v_sync = 1'b0;
    end
end
always @(posedge clk_out1) begin
    if('d20 <= v_cnt && v_cnt < ('d20 + 'd720)) begin
        v_valid = 1'b1;
    end
    else begin
        v_valid = 1'b0;
    end
end

always @(posedge clk_out1) begin
    if(v_cnt >= 'd600) begin
        if(h_cnt >= 'd1000) begin
            data[23:16] <= 8'b1111_1111;
        end
        else if(h_cnt >= 'd700)begin
            data[7:0] <= 8'b1111_1111;
        end
        else if(h_cnt >= 'd500)begin
            data[15:8] <= 8'b1111_1111;            
        end
        else if(h_cnt == 'd0)begin
            data <= 'd0;
        end            
    end
    else if (v_cnt >= 'd300) begin
        if(h_cnt >= 'd1000) begin
            data[7:0] <= 8'b1111_1111;
        end
        else if(h_cnt >= 'd700)begin
            data[15:8] <= 8'b1111_1111;
        end
        else if(h_cnt >= 'd500)begin
            data[23:16] <= 8'b1111_1111;
        end
        else if(h_cnt == 'd0)begin
            data <= 'd0;
        end
    end
    else begin
        if (h_cnt[6:0] == 7'b1000000) begin
            data <= {data[15:8], data[7:0], data[23:16]};
        end
        else if (h_cnt == 'd0) begin
            data <= 23'h0000FF;
        end
    end
end


endmodule
