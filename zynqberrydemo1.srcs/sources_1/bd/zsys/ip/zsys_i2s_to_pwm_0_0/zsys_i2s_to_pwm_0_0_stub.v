// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Sun Sep 29 12:41:45 2019
// Host        : DESKTOP-FGTB7AJ running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/house/Downloads/te0726-zynqberrydemo1-vivado_2018.2-build_03_20181120163939/zynqberrydemo1/vivado/zynqberrydemo1.srcs/sources_1/bd/zsys/ip/zsys_i2s_to_pwm_0_0/zsys_i2s_to_pwm_0_0_stub.v
// Design      : zsys_i2s_to_pwm_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg225-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "i2s_to_pwm,Vivado 2018.2" *)
module zsys_i2s_to_pwm_0_0(clk_in, i2s_bclk, i2s_lrclk, i2s_sdata, 
  pwm_l_out, pwm_r_out)
/* synthesis syn_black_box black_box_pad_pin="clk_in,i2s_bclk,i2s_lrclk,i2s_sdata,pwm_l_out,pwm_r_out" */;
  input clk_in;
  input i2s_bclk;
  input i2s_lrclk;
  input i2s_sdata;
  output pwm_l_out;
  output pwm_r_out;
endmodule