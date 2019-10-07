/*
 * *****************************************************************
 * File: top_zynqberry.v
 * Category: sources_1
 * File Created: 2019/10/07 21:53
 * Author: kidtak51 ( 45393331+kidtak51@users.noreply.github.com )
 * *****
 * Last Modified: 2019/10/08 24:05
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
    //output[0:0]    hdmi_clk_n       ,
    //output[0:0]    hdmi_clk_p       ,
    //output[2:0]    hdmi_data_n      ,
    //output[2:0]    hdmi_data_p      ,
    output[0:0]    led_op           ,
    input [0:0]    ps_clk           
);

led_ctrl u_Led_Chika(
      .clk_ip(ps_clk),
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
    
endmodule
