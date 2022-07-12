// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sun Jan 30 10:35:26 2022
// Host        : DESKTOP-864GRHJ running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/Lingke/Desktop/FYP/FYP_AI_on_FPGA/UART_Testing/UART_Testing.sim/sim_1/synth/func/xsim/UART_TB_func_synth.v
// Design      : UART_Wrapper
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module UART_RX
   (RX_Done,
    p_0_in,
    E,
    D,
    p_1_in,
    uart_txd_in_IBUF,
    sysclk_IBUF_BUFG,
    \RAM_received_address_reg[0] ,
    \RAM_received_address_reg[0]_0 ,
    Q);
  output RX_Done;
  output [1:0]p_0_in;
  output [0:0]E;
  output [3:0]D;
  output [7:0]p_1_in;
  input uart_txd_in_IBUF;
  input sysclk_IBUF_BUFG;
  input \RAM_received_address_reg[0] ;
  input \RAM_received_address_reg[0]_0 ;
  input [3:0]Q;

  wire [3:0]D;
  wire [0:0]E;
  wire [3:0]Q;
  wire \RAM_received_address_reg[0] ;
  wire \RAM_received_address_reg[0]_0 ;
  wire RAM_reg_0_15_0_0_i_2_n_0;
  wire RX_Done;
  wire [1:0]p_0_in;
  wire [7:0]p_1_in;
  wire r_Bit_Index;
  wire \r_Bit_Index[0]_i_1_n_0 ;
  wire \r_Bit_Index[1]_i_1_n_0 ;
  wire \r_Bit_Index[2]_i_1_n_0 ;
  wire \r_Bit_Index[2]_i_2__0_n_0 ;
  wire \r_Bit_Index_reg_n_0_[0] ;
  wire \r_Bit_Index_reg_n_0_[1] ;
  wire \r_Bit_Index_reg_n_0_[2] ;
  wire [10:0]r_Clock_Count;
  wire [10:2]r_Clock_Count0;
  wire \r_Clock_Count[0]_i_1__0_n_0 ;
  wire \r_Clock_Count[10]_i_2__0_n_0 ;
  wire \r_Clock_Count[10]_i_3__0_n_0 ;
  wire \r_Clock_Count[1]_i_1__0_n_0 ;
  wire \r_Clock_Count[2]_i_1__0_n_0 ;
  wire \r_Clock_Count[3]_i_1__0_n_0 ;
  wire \r_Clock_Count[4]_i_1__0_n_0 ;
  wire \r_Clock_Count[5]_i_1__0_n_0 ;
  wire \r_Clock_Count[6]_i_1__0_n_0 ;
  wire \r_Clock_Count[6]_i_2_n_0 ;
  wire \r_Clock_Count[7]_i_1__0_n_0 ;
  wire \r_Clock_Count[8]_i_1__0_n_0 ;
  wire \r_Clock_Count[9]_i_1__0_n_0 ;
  wire \r_Rx_Byte[0]_i_1_n_0 ;
  wire \r_Rx_Byte[0]_i_2_n_0 ;
  wire \r_Rx_Byte[1]_i_1_n_0 ;
  wire \r_Rx_Byte[1]_i_2_n_0 ;
  wire \r_Rx_Byte[2]_i_1_n_0 ;
  wire \r_Rx_Byte[2]_i_2_n_0 ;
  wire \r_Rx_Byte[3]_i_1_n_0 ;
  wire \r_Rx_Byte[3]_i_2_n_0 ;
  wire \r_Rx_Byte[4]_i_1_n_0 ;
  wire \r_Rx_Byte[4]_i_2_n_0 ;
  wire \r_Rx_Byte[5]_i_1_n_0 ;
  wire \r_Rx_Byte[5]_i_2_n_0 ;
  wire \r_Rx_Byte[6]_i_1_n_0 ;
  wire \r_Rx_Byte[6]_i_2_n_0 ;
  wire \r_Rx_Byte[7]_i_1_n_0 ;
  wire \r_Rx_Byte[7]_i_2_n_0 ;
  wire r_Rx_DV_i_1_n_0;
  wire r_Rx_Data;
  wire r_Rx_Data_R;
  wire \r_SM_Main[0]_i_1_n_0 ;
  wire \r_SM_Main[0]_i_2_n_0 ;
  wire \r_SM_Main[0]_i_3_n_0 ;
  wire \r_SM_Main[0]_i_4_n_0 ;
  wire \r_SM_Main[1]_i_1_n_0 ;
  wire \r_SM_Main[1]_i_2_n_0 ;
  wire \r_SM_Main[1]_i_3_n_0 ;
  wire \r_SM_Main[1]_i_4_n_0 ;
  wire \r_SM_Main[2]_i_1_n_0 ;
  wire \r_SM_Main[2]_i_2_n_0 ;
  wire \r_SM_Main[2]_i_3_n_0 ;
  wire \r_SM_Main[2]_i_4_n_0 ;
  wire \r_SM_Main_reg_n_0_[0] ;
  wire \r_SM_Main_reg_n_0_[1] ;
  wire \r_SM_Main_reg_n_0_[2] ;
  wire sysclk_IBUF_BUFG;
  wire uart_txd_in_IBUF;

  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \RAM_received_address[0]_i_1 
       (.I0(RX_Done),
        .I1(Q[0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \RAM_received_address[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(RX_Done),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7800)) 
    \RAM_received_address[2]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(RX_Done),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFF40000000)) 
    \RAM_received_address[3]_i_1 
       (.I0(\RAM_received_address_reg[0]_0 ),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(p_0_in[0]),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h28888888)) 
    \RAM_received_address[3]_i_2 
       (.I0(RX_Done),
        .I1(Q[3]),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(Q[2]),
        .O(D[3]));
  LUT2 #(
    .INIT(4'h2)) 
    RAM_reg_0_15_0_0__7_i_1
       (.I0(\RAM_received_address_reg[0] ),
        .I1(RAM_reg_0_15_0_0_i_2_n_0),
        .O(p_0_in[1]));
  LUT2 #(
    .INIT(4'h1)) 
    RAM_reg_0_15_0_0_i_1
       (.I0(\RAM_received_address_reg[0] ),
        .I1(RAM_reg_0_15_0_0_i_2_n_0),
        .O(p_0_in[0]));
  LUT6 #(
    .INIT(64'hFBBBBBBBBBBBBBBB)) 
    RAM_reg_0_15_0_0_i_2
       (.I0(\RAM_received_address_reg[0]_0 ),
        .I1(RX_Done),
        .I2(Q[3]),
        .I3(Q[2]),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(RAM_reg_0_15_0_0_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hA9A0)) 
    \r_Bit_Index[0]_i_1 
       (.I0(\r_Bit_Index_reg_n_0_[0] ),
        .I1(\r_SM_Main[2]_i_2_n_0 ),
        .I2(\r_Bit_Index[2]_i_2__0_n_0 ),
        .I3(\r_SM_Main_reg_n_0_[1] ),
        .O(\r_Bit_Index[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hAA9AAA00)) 
    \r_Bit_Index[1]_i_1 
       (.I0(\r_Bit_Index_reg_n_0_[1] ),
        .I1(\r_SM_Main[2]_i_2_n_0 ),
        .I2(\r_Bit_Index_reg_n_0_[0] ),
        .I3(\r_Bit_Index[2]_i_2__0_n_0 ),
        .I4(\r_SM_Main_reg_n_0_[1] ),
        .O(\r_Bit_Index[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA9AAAAAAA0000)) 
    \r_Bit_Index[2]_i_1 
       (.I0(\r_Bit_Index_reg_n_0_[2] ),
        .I1(\r_SM_Main[2]_i_2_n_0 ),
        .I2(\r_Bit_Index_reg_n_0_[0] ),
        .I3(\r_Bit_Index_reg_n_0_[1] ),
        .I4(\r_Bit_Index[2]_i_2__0_n_0 ),
        .I5(\r_SM_Main_reg_n_0_[1] ),
        .O(\r_Bit_Index[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \r_Bit_Index[2]_i_2__0 
       (.I0(\r_SM_Main_reg_n_0_[2] ),
        .I1(\r_SM_Main_reg_n_0_[0] ),
        .O(\r_Bit_Index[2]_i_2__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_Bit_Index_reg[0] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_Bit_Index[0]_i_1_n_0 ),
        .Q(\r_Bit_Index_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Bit_Index_reg[1] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_Bit_Index[1]_i_1_n_0 ),
        .Q(\r_Bit_Index_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Bit_Index_reg[2] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_Bit_Index[2]_i_1_n_0 ),
        .Q(\r_Bit_Index_reg_n_0_[2] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h3000B8BB)) 
    \r_Clock_Count[0]_i_1__0 
       (.I0(\r_SM_Main[2]_i_2_n_0 ),
        .I1(\r_SM_Main_reg_n_0_[1] ),
        .I2(r_Rx_Data),
        .I3(\r_SM_Main[1]_i_2_n_0 ),
        .I4(r_Clock_Count[0]),
        .O(\r_Clock_Count[0]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \r_Clock_Count[10]_i_1__0 
       (.I0(\r_SM_Main_reg_n_0_[1] ),
        .I1(\r_SM_Main_reg_n_0_[0] ),
        .I2(\r_SM_Main_reg_n_0_[2] ),
        .O(r_Bit_Index));
  LUT5 #(
    .INIT(32'h55550444)) 
    \r_Clock_Count[10]_i_2__0 
       (.I0(\r_SM_Main_reg_n_0_[2] ),
        .I1(\r_SM_Main_reg_n_0_[0] ),
        .I2(r_Rx_Data),
        .I3(\r_SM_Main[1]_i_2_n_0 ),
        .I4(\r_SM_Main_reg_n_0_[1] ),
        .O(\r_Clock_Count[10]_i_2__0_n_0 ));
  LUT5 #(
    .INIT(32'hB8BB3000)) 
    \r_Clock_Count[10]_i_3__0 
       (.I0(\r_SM_Main[2]_i_2_n_0 ),
        .I1(\r_SM_Main_reg_n_0_[1] ),
        .I2(r_Rx_Data),
        .I3(\r_SM_Main[1]_i_2_n_0 ),
        .I4(r_Clock_Count0[10]),
        .O(\r_Clock_Count[10]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \r_Clock_Count[10]_i_4__0 
       (.I0(r_Clock_Count[8]),
        .I1(r_Clock_Count[6]),
        .I2(\r_Clock_Count[6]_i_2_n_0 ),
        .I3(r_Clock_Count[7]),
        .I4(r_Clock_Count[9]),
        .I5(r_Clock_Count[10]),
        .O(r_Clock_Count0[10]));
  LUT6 #(
    .INIT(64'h3000B8BBB8BB3000)) 
    \r_Clock_Count[1]_i_1__0 
       (.I0(\r_SM_Main[2]_i_2_n_0 ),
        .I1(\r_SM_Main_reg_n_0_[1] ),
        .I2(r_Rx_Data),
        .I3(\r_SM_Main[1]_i_2_n_0 ),
        .I4(r_Clock_Count[0]),
        .I5(r_Clock_Count[1]),
        .O(\r_Clock_Count[1]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'hB8BB3000)) 
    \r_Clock_Count[2]_i_1__0 
       (.I0(\r_SM_Main[2]_i_2_n_0 ),
        .I1(\r_SM_Main_reg_n_0_[1] ),
        .I2(r_Rx_Data),
        .I3(\r_SM_Main[1]_i_2_n_0 ),
        .I4(r_Clock_Count0[2]),
        .O(\r_Clock_Count[2]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'h78)) 
    \r_Clock_Count[2]_i_2 
       (.I0(r_Clock_Count[0]),
        .I1(r_Clock_Count[1]),
        .I2(r_Clock_Count[2]),
        .O(r_Clock_Count0[2]));
  LUT5 #(
    .INIT(32'hB8BB3000)) 
    \r_Clock_Count[3]_i_1__0 
       (.I0(\r_SM_Main[2]_i_2_n_0 ),
        .I1(\r_SM_Main_reg_n_0_[1] ),
        .I2(r_Rx_Data),
        .I3(\r_SM_Main[1]_i_2_n_0 ),
        .I4(r_Clock_Count0[3]),
        .O(\r_Clock_Count[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_Clock_Count[3]_i_2 
       (.I0(r_Clock_Count[1]),
        .I1(r_Clock_Count[0]),
        .I2(r_Clock_Count[2]),
        .I3(r_Clock_Count[3]),
        .O(r_Clock_Count0[3]));
  LUT5 #(
    .INIT(32'hB8BB3000)) 
    \r_Clock_Count[4]_i_1__0 
       (.I0(\r_SM_Main[2]_i_2_n_0 ),
        .I1(\r_SM_Main_reg_n_0_[1] ),
        .I2(r_Rx_Data),
        .I3(\r_SM_Main[1]_i_2_n_0 ),
        .I4(r_Clock_Count0[4]),
        .O(\r_Clock_Count[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \r_Clock_Count[4]_i_2 
       (.I0(r_Clock_Count[2]),
        .I1(r_Clock_Count[0]),
        .I2(r_Clock_Count[1]),
        .I3(r_Clock_Count[3]),
        .I4(r_Clock_Count[4]),
        .O(r_Clock_Count0[4]));
  LUT5 #(
    .INIT(32'hB8BB3000)) 
    \r_Clock_Count[5]_i_1__0 
       (.I0(\r_SM_Main[2]_i_2_n_0 ),
        .I1(\r_SM_Main_reg_n_0_[1] ),
        .I2(r_Rx_Data),
        .I3(\r_SM_Main[1]_i_2_n_0 ),
        .I4(r_Clock_Count0[5]),
        .O(\r_Clock_Count[5]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \r_Clock_Count[5]_i_2 
       (.I0(r_Clock_Count[3]),
        .I1(r_Clock_Count[1]),
        .I2(r_Clock_Count[0]),
        .I3(r_Clock_Count[2]),
        .I4(r_Clock_Count[4]),
        .I5(r_Clock_Count[5]),
        .O(r_Clock_Count0[5]));
  LUT6 #(
    .INIT(64'h3000B8BBB8BB3000)) 
    \r_Clock_Count[6]_i_1__0 
       (.I0(\r_SM_Main[2]_i_2_n_0 ),
        .I1(\r_SM_Main_reg_n_0_[1] ),
        .I2(r_Rx_Data),
        .I3(\r_SM_Main[1]_i_2_n_0 ),
        .I4(\r_Clock_Count[6]_i_2_n_0 ),
        .I5(r_Clock_Count[6]),
        .O(\r_Clock_Count[6]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \r_Clock_Count[6]_i_2 
       (.I0(r_Clock_Count[5]),
        .I1(r_Clock_Count[3]),
        .I2(r_Clock_Count[1]),
        .I3(r_Clock_Count[0]),
        .I4(r_Clock_Count[2]),
        .I5(r_Clock_Count[4]),
        .O(\r_Clock_Count[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BB3000)) 
    \r_Clock_Count[7]_i_1__0 
       (.I0(\r_SM_Main[2]_i_2_n_0 ),
        .I1(\r_SM_Main_reg_n_0_[1] ),
        .I2(r_Rx_Data),
        .I3(\r_SM_Main[1]_i_2_n_0 ),
        .I4(r_Clock_Count0[7]),
        .O(\r_Clock_Count[7]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \r_Clock_Count[7]_i_2 
       (.I0(\r_Clock_Count[6]_i_2_n_0 ),
        .I1(r_Clock_Count[6]),
        .I2(r_Clock_Count[7]),
        .O(r_Clock_Count0[7]));
  LUT5 #(
    .INIT(32'hB8BB3000)) 
    \r_Clock_Count[8]_i_1__0 
       (.I0(\r_SM_Main[2]_i_2_n_0 ),
        .I1(\r_SM_Main_reg_n_0_[1] ),
        .I2(r_Rx_Data),
        .I3(\r_SM_Main[1]_i_2_n_0 ),
        .I4(r_Clock_Count0[8]),
        .O(\r_Clock_Count[8]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \r_Clock_Count[8]_i_2__0 
       (.I0(r_Clock_Count[6]),
        .I1(\r_Clock_Count[6]_i_2_n_0 ),
        .I2(r_Clock_Count[7]),
        .I3(r_Clock_Count[8]),
        .O(r_Clock_Count0[8]));
  LUT5 #(
    .INIT(32'hB8BB3000)) 
    \r_Clock_Count[9]_i_1__0 
       (.I0(\r_SM_Main[2]_i_2_n_0 ),
        .I1(\r_SM_Main_reg_n_0_[1] ),
        .I2(r_Rx_Data),
        .I3(\r_SM_Main[1]_i_2_n_0 ),
        .I4(r_Clock_Count0[9]),
        .O(\r_Clock_Count[9]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \r_Clock_Count[9]_i_2 
       (.I0(r_Clock_Count[7]),
        .I1(\r_Clock_Count[6]_i_2_n_0 ),
        .I2(r_Clock_Count[6]),
        .I3(r_Clock_Count[8]),
        .I4(r_Clock_Count[9]),
        .O(r_Clock_Count0[9]));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clock_Count_reg[0] 
       (.C(sysclk_IBUF_BUFG),
        .CE(\r_Clock_Count[10]_i_2__0_n_0 ),
        .D(\r_Clock_Count[0]_i_1__0_n_0 ),
        .Q(r_Clock_Count[0]),
        .R(r_Bit_Index));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clock_Count_reg[10] 
       (.C(sysclk_IBUF_BUFG),
        .CE(\r_Clock_Count[10]_i_2__0_n_0 ),
        .D(\r_Clock_Count[10]_i_3__0_n_0 ),
        .Q(r_Clock_Count[10]),
        .R(r_Bit_Index));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clock_Count_reg[1] 
       (.C(sysclk_IBUF_BUFG),
        .CE(\r_Clock_Count[10]_i_2__0_n_0 ),
        .D(\r_Clock_Count[1]_i_1__0_n_0 ),
        .Q(r_Clock_Count[1]),
        .R(r_Bit_Index));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clock_Count_reg[2] 
       (.C(sysclk_IBUF_BUFG),
        .CE(\r_Clock_Count[10]_i_2__0_n_0 ),
        .D(\r_Clock_Count[2]_i_1__0_n_0 ),
        .Q(r_Clock_Count[2]),
        .R(r_Bit_Index));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clock_Count_reg[3] 
       (.C(sysclk_IBUF_BUFG),
        .CE(\r_Clock_Count[10]_i_2__0_n_0 ),
        .D(\r_Clock_Count[3]_i_1__0_n_0 ),
        .Q(r_Clock_Count[3]),
        .R(r_Bit_Index));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clock_Count_reg[4] 
       (.C(sysclk_IBUF_BUFG),
        .CE(\r_Clock_Count[10]_i_2__0_n_0 ),
        .D(\r_Clock_Count[4]_i_1__0_n_0 ),
        .Q(r_Clock_Count[4]),
        .R(r_Bit_Index));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clock_Count_reg[5] 
       (.C(sysclk_IBUF_BUFG),
        .CE(\r_Clock_Count[10]_i_2__0_n_0 ),
        .D(\r_Clock_Count[5]_i_1__0_n_0 ),
        .Q(r_Clock_Count[5]),
        .R(r_Bit_Index));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clock_Count_reg[6] 
       (.C(sysclk_IBUF_BUFG),
        .CE(\r_Clock_Count[10]_i_2__0_n_0 ),
        .D(\r_Clock_Count[6]_i_1__0_n_0 ),
        .Q(r_Clock_Count[6]),
        .R(r_Bit_Index));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clock_Count_reg[7] 
       (.C(sysclk_IBUF_BUFG),
        .CE(\r_Clock_Count[10]_i_2__0_n_0 ),
        .D(\r_Clock_Count[7]_i_1__0_n_0 ),
        .Q(r_Clock_Count[7]),
        .R(r_Bit_Index));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clock_Count_reg[8] 
       (.C(sysclk_IBUF_BUFG),
        .CE(\r_Clock_Count[10]_i_2__0_n_0 ),
        .D(\r_Clock_Count[8]_i_1__0_n_0 ),
        .Q(r_Clock_Count[8]),
        .R(r_Bit_Index));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clock_Count_reg[9] 
       (.C(sysclk_IBUF_BUFG),
        .CE(\r_Clock_Count[10]_i_2__0_n_0 ),
        .D(\r_Clock_Count[9]_i_1__0_n_0 ),
        .Q(r_Clock_Count[9]),
        .R(r_Bit_Index));
  LUT6 #(
    .INIT(64'hFFFFFFBF00000080)) 
    \r_Rx_Byte[0]_i_1 
       (.I0(r_Rx_Data),
        .I1(\r_SM_Main_reg_n_0_[1] ),
        .I2(\r_Rx_Byte[0]_i_2_n_0 ),
        .I3(\r_SM_Main[2]_i_2_n_0 ),
        .I4(\r_Bit_Index[2]_i_2__0_n_0 ),
        .I5(p_1_in[0]),
        .O(\r_Rx_Byte[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \r_Rx_Byte[0]_i_2 
       (.I0(\r_Bit_Index_reg_n_0_[2] ),
        .I1(\r_Bit_Index_reg_n_0_[0] ),
        .I2(\r_Bit_Index_reg_n_0_[1] ),
        .O(\r_Rx_Byte[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFBF00000080)) 
    \r_Rx_Byte[1]_i_1 
       (.I0(r_Rx_Data),
        .I1(\r_SM_Main_reg_n_0_[1] ),
        .I2(\r_Rx_Byte[1]_i_2_n_0 ),
        .I3(\r_SM_Main[2]_i_2_n_0 ),
        .I4(\r_Bit_Index[2]_i_2__0_n_0 ),
        .I5(p_1_in[1]),
        .O(\r_Rx_Byte[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \r_Rx_Byte[1]_i_2 
       (.I0(\r_Bit_Index_reg_n_0_[2] ),
        .I1(\r_Bit_Index_reg_n_0_[0] ),
        .I2(\r_Bit_Index_reg_n_0_[1] ),
        .O(\r_Rx_Byte[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFBF00000080)) 
    \r_Rx_Byte[2]_i_1 
       (.I0(r_Rx_Data),
        .I1(\r_SM_Main_reg_n_0_[1] ),
        .I2(\r_Rx_Byte[2]_i_2_n_0 ),
        .I3(\r_SM_Main[2]_i_2_n_0 ),
        .I4(\r_Bit_Index[2]_i_2__0_n_0 ),
        .I5(p_1_in[2]),
        .O(\r_Rx_Byte[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \r_Rx_Byte[2]_i_2 
       (.I0(\r_Bit_Index_reg_n_0_[2] ),
        .I1(\r_Bit_Index_reg_n_0_[1] ),
        .I2(\r_Bit_Index_reg_n_0_[0] ),
        .O(\r_Rx_Byte[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFBF00000080)) 
    \r_Rx_Byte[3]_i_1 
       (.I0(r_Rx_Data),
        .I1(\r_SM_Main_reg_n_0_[1] ),
        .I2(\r_Rx_Byte[3]_i_2_n_0 ),
        .I3(\r_SM_Main[2]_i_2_n_0 ),
        .I4(\r_Bit_Index[2]_i_2__0_n_0 ),
        .I5(p_1_in[3]),
        .O(\r_Rx_Byte[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \r_Rx_Byte[3]_i_2 
       (.I0(\r_Bit_Index_reg_n_0_[2] ),
        .I1(\r_Bit_Index_reg_n_0_[0] ),
        .I2(\r_Bit_Index_reg_n_0_[1] ),
        .O(\r_Rx_Byte[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFBF00000080)) 
    \r_Rx_Byte[4]_i_1 
       (.I0(r_Rx_Data),
        .I1(\r_SM_Main_reg_n_0_[1] ),
        .I2(\r_Rx_Byte[4]_i_2_n_0 ),
        .I3(\r_SM_Main[2]_i_2_n_0 ),
        .I4(\r_Bit_Index[2]_i_2__0_n_0 ),
        .I5(p_1_in[4]),
        .O(\r_Rx_Byte[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \r_Rx_Byte[4]_i_2 
       (.I0(\r_Bit_Index_reg_n_0_[2] ),
        .I1(\r_Bit_Index_reg_n_0_[0] ),
        .I2(\r_Bit_Index_reg_n_0_[1] ),
        .O(\r_Rx_Byte[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFBF00000080)) 
    \r_Rx_Byte[5]_i_1 
       (.I0(r_Rx_Data),
        .I1(\r_SM_Main_reg_n_0_[1] ),
        .I2(\r_Rx_Byte[5]_i_2_n_0 ),
        .I3(\r_SM_Main[2]_i_2_n_0 ),
        .I4(\r_Bit_Index[2]_i_2__0_n_0 ),
        .I5(p_1_in[5]),
        .O(\r_Rx_Byte[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \r_Rx_Byte[5]_i_2 
       (.I0(\r_Bit_Index_reg_n_0_[2] ),
        .I1(\r_Bit_Index_reg_n_0_[0] ),
        .I2(\r_Bit_Index_reg_n_0_[1] ),
        .O(\r_Rx_Byte[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFBF00000080)) 
    \r_Rx_Byte[6]_i_1 
       (.I0(r_Rx_Data),
        .I1(\r_SM_Main_reg_n_0_[1] ),
        .I2(\r_Rx_Byte[6]_i_2_n_0 ),
        .I3(\r_SM_Main[2]_i_2_n_0 ),
        .I4(\r_Bit_Index[2]_i_2__0_n_0 ),
        .I5(p_1_in[6]),
        .O(\r_Rx_Byte[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \r_Rx_Byte[6]_i_2 
       (.I0(\r_Bit_Index_reg_n_0_[2] ),
        .I1(\r_Bit_Index_reg_n_0_[1] ),
        .I2(\r_Bit_Index_reg_n_0_[0] ),
        .O(\r_Rx_Byte[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFBF00000080)) 
    \r_Rx_Byte[7]_i_1 
       (.I0(r_Rx_Data),
        .I1(\r_SM_Main_reg_n_0_[1] ),
        .I2(\r_Rx_Byte[7]_i_2_n_0 ),
        .I3(\r_SM_Main[2]_i_2_n_0 ),
        .I4(\r_Bit_Index[2]_i_2__0_n_0 ),
        .I5(p_1_in[7]),
        .O(\r_Rx_Byte[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \r_Rx_Byte[7]_i_2 
       (.I0(\r_Bit_Index_reg_n_0_[2] ),
        .I1(\r_Bit_Index_reg_n_0_[0] ),
        .I2(\r_Bit_Index_reg_n_0_[1] ),
        .O(\r_Rx_Byte[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_Rx_Byte_reg[0] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_Rx_Byte[0]_i_1_n_0 ),
        .Q(p_1_in[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Rx_Byte_reg[1] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_Rx_Byte[1]_i_1_n_0 ),
        .Q(p_1_in[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Rx_Byte_reg[2] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_Rx_Byte[2]_i_1_n_0 ),
        .Q(p_1_in[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Rx_Byte_reg[3] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_Rx_Byte[3]_i_1_n_0 ),
        .Q(p_1_in[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Rx_Byte_reg[4] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_Rx_Byte[4]_i_1_n_0 ),
        .Q(p_1_in[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Rx_Byte_reg[5] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_Rx_Byte[5]_i_1_n_0 ),
        .Q(p_1_in[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Rx_Byte_reg[6] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_Rx_Byte[6]_i_1_n_0 ),
        .Q(p_1_in[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Rx_Byte_reg[7] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_Rx_Byte[7]_i_1_n_0 ),
        .Q(p_1_in[7]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFFF01000)) 
    r_Rx_DV_i_1
       (.I0(\r_SM_Main_reg_n_0_[2] ),
        .I1(\r_SM_Main[2]_i_2_n_0 ),
        .I2(\r_SM_Main_reg_n_0_[0] ),
        .I3(\r_SM_Main_reg_n_0_[1] ),
        .I4(RX_Done),
        .O(r_Rx_DV_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    r_Rx_DV_reg
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(r_Rx_DV_i_1_n_0),
        .Q(RX_Done),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    r_Rx_Data_R_reg
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(uart_txd_in_IBUF),
        .Q(r_Rx_Data_R),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    r_Rx_Data_reg
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(r_Rx_Data_R),
        .Q(r_Rx_Data),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000000FF1D001D)) 
    \r_SM_Main[0]_i_1 
       (.I0(r_Rx_Data),
        .I1(\r_SM_Main_reg_n_0_[0] ),
        .I2(\r_SM_Main[1]_i_2_n_0 ),
        .I3(\r_SM_Main_reg_n_0_[1] ),
        .I4(\r_SM_Main[0]_i_2_n_0 ),
        .I5(\r_SM_Main_reg_n_0_[2] ),
        .O(\r_SM_Main[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1A1A1A1AAAAA1AAA)) 
    \r_SM_Main[0]_i_2 
       (.I0(\r_SM_Main_reg_n_0_[0] ),
        .I1(\r_SM_Main[0]_i_3_n_0 ),
        .I2(r_Clock_Count[10]),
        .I3(\r_SM_Main[2]_i_4_n_0 ),
        .I4(\r_SM_Main[2]_i_3_n_0 ),
        .I5(\r_SM_Main[0]_i_4_n_0 ),
        .O(\r_SM_Main[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \r_SM_Main[0]_i_3 
       (.I0(\r_Bit_Index_reg_n_0_[2] ),
        .I1(\r_Bit_Index_reg_n_0_[1] ),
        .I2(\r_Bit_Index_reg_n_0_[0] ),
        .O(\r_SM_Main[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \r_SM_Main[0]_i_4 
       (.I0(r_Clock_Count[8]),
        .I1(r_Clock_Count[9]),
        .O(\r_SM_Main[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FF200F20)) 
    \r_SM_Main[1]_i_1 
       (.I0(\r_SM_Main[1]_i_2_n_0 ),
        .I1(r_Rx_Data),
        .I2(\r_SM_Main_reg_n_0_[0] ),
        .I3(\r_SM_Main_reg_n_0_[1] ),
        .I4(\r_SM_Main[2]_i_2_n_0 ),
        .I5(\r_SM_Main_reg_n_0_[2] ),
        .O(\r_SM_Main[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEEEFAAAAAAAA)) 
    \r_SM_Main[1]_i_2 
       (.I0(r_Clock_Count[10]),
        .I1(r_Clock_Count[7]),
        .I2(\r_SM_Main[1]_i_3_n_0 ),
        .I3(\r_SM_Main[1]_i_4_n_0 ),
        .I4(r_Clock_Count[8]),
        .I5(r_Clock_Count[9]),
        .O(\r_SM_Main[1]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \r_SM_Main[1]_i_3 
       (.I0(r_Clock_Count[4]),
        .I1(r_Clock_Count[5]),
        .O(\r_SM_Main[1]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h55555557)) 
    \r_SM_Main[1]_i_4 
       (.I0(r_Clock_Count[6]),
        .I1(r_Clock_Count[3]),
        .I2(r_Clock_Count[0]),
        .I3(r_Clock_Count[1]),
        .I4(r_Clock_Count[2]),
        .O(\r_SM_Main[1]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0020)) 
    \r_SM_Main[2]_i_1 
       (.I0(\r_SM_Main_reg_n_0_[0] ),
        .I1(\r_SM_Main[2]_i_2_n_0 ),
        .I2(\r_SM_Main_reg_n_0_[1] ),
        .I3(\r_SM_Main_reg_n_0_[2] ),
        .O(\r_SM_Main[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h1011FFFF)) 
    \r_SM_Main[2]_i_2 
       (.I0(r_Clock_Count[8]),
        .I1(r_Clock_Count[9]),
        .I2(\r_SM_Main[2]_i_3_n_0 ),
        .I3(\r_SM_Main[2]_i_4_n_0 ),
        .I4(r_Clock_Count[10]),
        .O(\r_SM_Main[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \r_SM_Main[2]_i_3 
       (.I0(r_Clock_Count[3]),
        .I1(r_Clock_Count[4]),
        .I2(r_Clock_Count[1]),
        .I3(r_Clock_Count[2]),
        .I4(r_Clock_Count[0]),
        .O(\r_SM_Main[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \r_SM_Main[2]_i_4 
       (.I0(r_Clock_Count[5]),
        .I1(r_Clock_Count[7]),
        .I2(r_Clock_Count[6]),
        .O(\r_SM_Main[2]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_SM_Main_reg[0] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_SM_Main[0]_i_1_n_0 ),
        .Q(\r_SM_Main_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_SM_Main_reg[1] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_SM_Main[1]_i_1_n_0 ),
        .Q(\r_SM_Main_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_SM_Main_reg[2] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_SM_Main[2]_i_1_n_0 ),
        .Q(\r_SM_Main_reg_n_0_[2] ),
        .R(1'b0));
endmodule

module UART_TX
   (uart_rxd_out_OBUF,
    RAM_address_bias_reg,
    E,
    RAM_sent_address_reg_0_sp_1,
    RAM_sent_address_reg_1_sp_1,
    state_reg,
    state_reg_0,
    sysclk_IBUF_BUFG,
    \RAM_sent_address_reg[0]_0 ,
    TX_Start_reg,
    \RAM_sent_address_reg[0]_1 ,
    TX_Start,
    RAM_sent_address_reg,
    RX_Done,
    RAM_address_bias_reg_0,
    RAM_address_bias_reg_1,
    Q);
  output uart_rxd_out_OBUF;
  output RAM_address_bias_reg;
  output [0:0]E;
  output RAM_sent_address_reg_0_sp_1;
  output RAM_sent_address_reg_1_sp_1;
  output state_reg;
  output state_reg_0;
  input sysclk_IBUF_BUFG;
  input \RAM_sent_address_reg[0]_0 ;
  input TX_Start_reg;
  input \RAM_sent_address_reg[0]_1 ;
  input TX_Start;
  input [3:0]RAM_sent_address_reg;
  input RX_Done;
  input RAM_address_bias_reg_0;
  input RAM_address_bias_reg_1;
  input [7:0]Q;

  wire [0:0]E;
  wire \FSM_sequential_r_SM_Main[0]_i_2_n_0 ;
  wire \FSM_sequential_r_SM_Main[1]_i_1_n_0 ;
  wire \FSM_sequential_r_SM_Main[2]_i_2_n_0 ;
  wire \FSM_sequential_r_SM_Main[2]_i_3_n_0 ;
  wire \FSM_sequential_r_SM_Main[2]_i_4_n_0 ;
  wire [7:0]Q;
  wire RAM_address_bias_reg;
  wire RAM_address_bias_reg_0;
  wire RAM_address_bias_reg_1;
  wire [3:0]RAM_sent_address_reg;
  wire \RAM_sent_address_reg[0]_0 ;
  wire \RAM_sent_address_reg[0]_1 ;
  wire RAM_sent_address_reg_0_sn_1;
  wire RAM_sent_address_reg_1_sn_1;
  wire RX_Done;
  wire TX_Active;
  wire TX_Start;
  wire TX_Start_reg;
  wire \TX_data_out[7]_i_3_n_0 ;
  wire o_Tx_Serial_i_1_n_0;
  wire o_Tx_Serial_i_2_n_0;
  wire o_Tx_Serial_i_3_n_0;
  wire o_Tx_Serial_i_4_n_0;
  wire \r_Bit_Index[0]_i_1_n_0 ;
  wire \r_Bit_Index[1]_i_1_n_0 ;
  wire \r_Bit_Index[2]_i_1_n_0 ;
  wire \r_Bit_Index[2]_i_2_n_0 ;
  wire \r_Bit_Index_reg_n_0_[0] ;
  wire \r_Bit_Index_reg_n_0_[1] ;
  wire \r_Bit_Index_reg_n_0_[2] ;
  wire r_Clock_Count;
  wire r_Clock_Count0;
  wire \r_Clock_Count[10]_i_4_n_0 ;
  wire \r_Clock_Count[10]_i_5_n_0 ;
  wire \r_Clock_Count[8]_i_2_n_0 ;
  wire [10:0]r_Clock_Count__0;
  wire [10:0]r_Clock_Count_reg;
  wire [2:0]r_SM_Main;
  wire [2:0]r_SM_Main__0;
  wire r_Tx_Active_i_1_n_0;
  wire [7:0]r_Tx_Data;
  wire r_Tx_Data_0;
  wire state_reg;
  wire state_reg_0;
  wire sysclk_IBUF_BUFG;
  wire uart_rxd_out_OBUF;

  assign RAM_sent_address_reg_0_sp_1 = RAM_sent_address_reg_0_sn_1;
  assign RAM_sent_address_reg_1_sp_1 = RAM_sent_address_reg_1_sn_1;
  LUT6 #(
    .INIT(64'h00000000FF4400E4)) 
    \FSM_sequential_r_SM_Main[0]_i_1 
       (.I0(r_SM_Main[1]),
        .I1(TX_Start),
        .I2(\FSM_sequential_r_SM_Main[0]_i_2_n_0 ),
        .I3(r_SM_Main[0]),
        .I4(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I5(r_SM_Main[2]),
        .O(r_SM_Main__0[0]));
  LUT3 #(
    .INIT(8'h80)) 
    \FSM_sequential_r_SM_Main[0]_i_2 
       (.I0(\r_Bit_Index_reg_n_0_[2] ),
        .I1(\r_Bit_Index_reg_n_0_[0] ),
        .I2(\r_Bit_Index_reg_n_0_[1] ),
        .O(\FSM_sequential_r_SM_Main[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h5104)) 
    \FSM_sequential_r_SM_Main[1]_i_1 
       (.I0(r_SM_Main[2]),
        .I1(r_SM_Main[0]),
        .I2(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I3(r_SM_Main[1]),
        .O(\FSM_sequential_r_SM_Main[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    \FSM_sequential_r_SM_Main[2]_i_1 
       (.I0(r_SM_Main[2]),
        .I1(r_SM_Main[0]),
        .I2(r_SM_Main[1]),
        .I3(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .O(r_SM_Main__0[2]));
  LUT5 #(
    .INIT(32'h1110FFFF)) 
    \FSM_sequential_r_SM_Main[2]_i_2 
       (.I0(r_Clock_Count_reg[8]),
        .I1(r_Clock_Count_reg[9]),
        .I2(\FSM_sequential_r_SM_Main[2]_i_3_n_0 ),
        .I3(\FSM_sequential_r_SM_Main[2]_i_4_n_0 ),
        .I4(r_Clock_Count_reg[10]),
        .O(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \FSM_sequential_r_SM_Main[2]_i_3 
       (.I0(r_Clock_Count_reg[7]),
        .I1(r_Clock_Count_reg[5]),
        .I2(r_Clock_Count_reg[6]),
        .O(\FSM_sequential_r_SM_Main[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \FSM_sequential_r_SM_Main[2]_i_4 
       (.I0(r_Clock_Count_reg[1]),
        .I1(r_Clock_Count_reg[0]),
        .I2(r_Clock_Count_reg[3]),
        .I3(r_Clock_Count_reg[4]),
        .I4(r_Clock_Count_reg[2]),
        .O(\FSM_sequential_r_SM_Main[2]_i_4_n_0 ));
  (* FSM_ENCODED_STATES = "s_IDLE:000,s_TX_START_BIT:001,s_TX_DATA_BITS:010,s_CLEANUP:100,s_TX_STOP_BIT:011" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_r_SM_Main_reg[0] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(r_SM_Main__0[0]),
        .Q(r_SM_Main[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "s_IDLE:000,s_TX_START_BIT:001,s_TX_DATA_BITS:010,s_CLEANUP:100,s_TX_STOP_BIT:011" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_r_SM_Main_reg[1] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_r_SM_Main[1]_i_1_n_0 ),
        .Q(r_SM_Main[1]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "s_IDLE:000,s_TX_START_BIT:001,s_TX_DATA_BITS:010,s_CLEANUP:100,s_TX_STOP_BIT:011" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_r_SM_Main_reg[2] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(r_SM_Main__0[2]),
        .Q(r_SM_Main[2]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFD7D787D2)) 
    RAM_address_bias_i_1
       (.I0(TX_Start_reg),
        .I1(\TX_data_out[7]_i_3_n_0 ),
        .I2(\RAM_sent_address_reg[0]_0 ),
        .I3(RX_Done),
        .I4(RAM_address_bias_reg_0),
        .I5(RAM_address_bias_reg_1),
        .O(state_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h0006)) 
    \RAM_sent_address[1]_i_1 
       (.I0(RAM_sent_address_reg[1]),
        .I1(RAM_sent_address_reg[0]),
        .I2(TX_Active),
        .I3(TX_Start),
        .O(RAM_sent_address_reg_1_sn_1));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h00000078)) 
    \RAM_sent_address[2]_i_1 
       (.I0(RAM_sent_address_reg[0]),
        .I1(RAM_sent_address_reg[1]),
        .I2(RAM_sent_address_reg[2]),
        .I3(TX_Active),
        .I4(TX_Start),
        .O(RAM_sent_address_reg_0_sn_1));
  LUT5 #(
    .INIT(32'h0C0C0C4C)) 
    \RAM_sent_address[3]_i_2 
       (.I0(\RAM_sent_address_reg[0]_0 ),
        .I1(TX_Start_reg),
        .I2(\RAM_sent_address_reg[0]_1 ),
        .I3(TX_Start),
        .I4(TX_Active),
        .O(RAM_address_bias_reg));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h74)) 
    TX_Start_i_1
       (.I0(\TX_data_out[7]_i_3_n_0 ),
        .I1(TX_Start_reg),
        .I2(TX_Start),
        .O(state_reg));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \TX_data_out[7]_i_1 
       (.I0(TX_Start_reg),
        .I1(\TX_data_out[7]_i_3_n_0 ),
        .O(E));
  LUT6 #(
    .INIT(64'hFEEEEEEEEEEEEEEE)) 
    \TX_data_out[7]_i_3 
       (.I0(TX_Active),
        .I1(TX_Start),
        .I2(RAM_sent_address_reg[3]),
        .I3(RAM_sent_address_reg[1]),
        .I4(RAM_sent_address_reg[0]),
        .I5(RAM_sent_address_reg[2]),
        .O(\TX_data_out[7]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    o_Tx_Serial_i_1
       (.I0(r_SM_Main[2]),
        .O(o_Tx_Serial_i_1_n_0));
  LUT5 #(
    .INIT(32'hBBB999B9)) 
    o_Tx_Serial_i_2
       (.I0(r_SM_Main[1]),
        .I1(r_SM_Main[0]),
        .I2(o_Tx_Serial_i_3_n_0),
        .I3(\r_Bit_Index_reg_n_0_[2] ),
        .I4(o_Tx_Serial_i_4_n_0),
        .O(o_Tx_Serial_i_2_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    o_Tx_Serial_i_3
       (.I0(r_Tx_Data[3]),
        .I1(r_Tx_Data[2]),
        .I2(\r_Bit_Index_reg_n_0_[1] ),
        .I3(r_Tx_Data[1]),
        .I4(\r_Bit_Index_reg_n_0_[0] ),
        .I5(r_Tx_Data[0]),
        .O(o_Tx_Serial_i_3_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    o_Tx_Serial_i_4
       (.I0(r_Tx_Data[7]),
        .I1(r_Tx_Data[6]),
        .I2(\r_Bit_Index_reg_n_0_[1] ),
        .I3(r_Tx_Data[5]),
        .I4(\r_Bit_Index_reg_n_0_[0] ),
        .I5(r_Tx_Data[4]),
        .O(o_Tx_Serial_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    o_Tx_Serial_reg
       (.C(sysclk_IBUF_BUFG),
        .CE(o_Tx_Serial_i_1_n_0),
        .D(o_Tx_Serial_i_2_n_0),
        .Q(uart_rxd_out_OBUF),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'hAAAAAA90)) 
    \r_Bit_Index[0]_i_1 
       (.I0(\r_Bit_Index_reg_n_0_[0] ),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I2(r_SM_Main[1]),
        .I3(r_SM_Main[2]),
        .I4(r_SM_Main[0]),
        .O(\r_Bit_Index[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAA9A00)) 
    \r_Bit_Index[1]_i_1 
       (.I0(\r_Bit_Index_reg_n_0_[1] ),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I2(\r_Bit_Index_reg_n_0_[0] ),
        .I3(r_SM_Main[1]),
        .I4(r_SM_Main[2]),
        .I5(r_SM_Main[0]),
        .O(\r_Bit_Index[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9AAA0000AAAAAAAA)) 
    \r_Bit_Index[2]_i_1 
       (.I0(\r_Bit_Index_reg_n_0_[2] ),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I2(\r_Bit_Index_reg_n_0_[1] ),
        .I3(\r_Bit_Index_reg_n_0_[0] ),
        .I4(r_SM_Main[1]),
        .I5(\r_Bit_Index[2]_i_2_n_0 ),
        .O(\r_Bit_Index[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \r_Bit_Index[2]_i_2 
       (.I0(r_SM_Main[2]),
        .I1(r_SM_Main[0]),
        .O(\r_Bit_Index[2]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \r_Bit_Index_reg[0] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_Bit_Index[0]_i_1_n_0 ),
        .Q(\r_Bit_Index_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Bit_Index_reg[1] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_Bit_Index[1]_i_1_n_0 ),
        .Q(\r_Bit_Index_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Bit_Index_reg[2] 
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(\r_Bit_Index[2]_i_1_n_0 ),
        .Q(\r_Bit_Index_reg_n_0_[2] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \r_Clock_Count[0]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(r_Clock_Count_reg[0]),
        .O(r_Clock_Count__0[0]));
  LUT3 #(
    .INIT(8'h01)) 
    \r_Clock_Count[10]_i_1 
       (.I0(r_SM_Main[0]),
        .I1(r_SM_Main[2]),
        .I2(r_SM_Main[1]),
        .O(r_Clock_Count0));
  LUT3 #(
    .INIT(8'h0E)) 
    \r_Clock_Count[10]_i_2 
       (.I0(r_SM_Main[0]),
        .I1(r_SM_Main[1]),
        .I2(r_SM_Main[2]),
        .O(r_Clock_Count));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \r_Clock_Count[10]_i_3 
       (.I0(\r_Clock_Count[10]_i_4_n_0 ),
        .I1(r_Clock_Count_reg[10]),
        .I2(\r_Clock_Count[10]_i_5_n_0 ),
        .I3(r_Clock_Count_reg[9]),
        .O(r_Clock_Count__0[10]));
  LUT6 #(
    .INIT(64'h000000000000BFFF)) 
    \r_Clock_Count[10]_i_4 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_4_n_0 ),
        .I1(r_Clock_Count_reg[7]),
        .I2(r_Clock_Count_reg[5]),
        .I3(r_Clock_Count_reg[6]),
        .I4(r_Clock_Count_reg[9]),
        .I5(r_Clock_Count_reg[8]),
        .O(\r_Clock_Count[10]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \r_Clock_Count[10]_i_5 
       (.I0(r_Clock_Count_reg[7]),
        .I1(r_Clock_Count_reg[5]),
        .I2(r_Clock_Count_reg[6]),
        .I3(\r_Clock_Count[8]_i_2_n_0 ),
        .I4(r_Clock_Count_reg[8]),
        .O(\r_Clock_Count[10]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \r_Clock_Count[1]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(r_Clock_Count_reg[0]),
        .I2(r_Clock_Count_reg[1]),
        .O(r_Clock_Count__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \r_Clock_Count[2]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(r_Clock_Count_reg[0]),
        .I2(r_Clock_Count_reg[1]),
        .I3(r_Clock_Count_reg[2]),
        .O(r_Clock_Count__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \r_Clock_Count[3]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(r_Clock_Count_reg[1]),
        .I2(r_Clock_Count_reg[0]),
        .I3(r_Clock_Count_reg[2]),
        .I4(r_Clock_Count_reg[3]),
        .O(r_Clock_Count__0[3]));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \r_Clock_Count[4]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(r_Clock_Count_reg[2]),
        .I2(r_Clock_Count_reg[0]),
        .I3(r_Clock_Count_reg[1]),
        .I4(r_Clock_Count_reg[3]),
        .I5(r_Clock_Count_reg[4]),
        .O(r_Clock_Count__0[4]));
  LUT3 #(
    .INIT(8'h28)) 
    \r_Clock_Count[5]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(\r_Clock_Count[8]_i_2_n_0 ),
        .I2(r_Clock_Count_reg[5]),
        .O(r_Clock_Count__0[5]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \r_Clock_Count[6]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(r_Clock_Count_reg[5]),
        .I2(\r_Clock_Count[8]_i_2_n_0 ),
        .I3(r_Clock_Count_reg[6]),
        .O(r_Clock_Count__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \r_Clock_Count[7]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(\r_Clock_Count[8]_i_2_n_0 ),
        .I2(r_Clock_Count_reg[5]),
        .I3(r_Clock_Count_reg[6]),
        .I4(r_Clock_Count_reg[7]),
        .O(r_Clock_Count__0[7]));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \r_Clock_Count[8]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(\r_Clock_Count[8]_i_2_n_0 ),
        .I2(r_Clock_Count_reg[6]),
        .I3(r_Clock_Count_reg[5]),
        .I4(r_Clock_Count_reg[7]),
        .I5(r_Clock_Count_reg[8]),
        .O(r_Clock_Count__0[8]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \r_Clock_Count[8]_i_2 
       (.I0(r_Clock_Count_reg[4]),
        .I1(r_Clock_Count_reg[3]),
        .I2(r_Clock_Count_reg[1]),
        .I3(r_Clock_Count_reg[0]),
        .I4(r_Clock_Count_reg[2]),
        .O(\r_Clock_Count[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \r_Clock_Count[9]_i_1 
       (.I0(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I1(\r_Clock_Count[10]_i_5_n_0 ),
        .I2(r_Clock_Count_reg[9]),
        .O(r_Clock_Count__0[9]));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clock_Count_reg[0] 
       (.C(sysclk_IBUF_BUFG),
        .CE(r_Clock_Count),
        .D(r_Clock_Count__0[0]),
        .Q(r_Clock_Count_reg[0]),
        .R(r_Clock_Count0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clock_Count_reg[10] 
       (.C(sysclk_IBUF_BUFG),
        .CE(r_Clock_Count),
        .D(r_Clock_Count__0[10]),
        .Q(r_Clock_Count_reg[10]),
        .R(r_Clock_Count0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clock_Count_reg[1] 
       (.C(sysclk_IBUF_BUFG),
        .CE(r_Clock_Count),
        .D(r_Clock_Count__0[1]),
        .Q(r_Clock_Count_reg[1]),
        .R(r_Clock_Count0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clock_Count_reg[2] 
       (.C(sysclk_IBUF_BUFG),
        .CE(r_Clock_Count),
        .D(r_Clock_Count__0[2]),
        .Q(r_Clock_Count_reg[2]),
        .R(r_Clock_Count0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clock_Count_reg[3] 
       (.C(sysclk_IBUF_BUFG),
        .CE(r_Clock_Count),
        .D(r_Clock_Count__0[3]),
        .Q(r_Clock_Count_reg[3]),
        .R(r_Clock_Count0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clock_Count_reg[4] 
       (.C(sysclk_IBUF_BUFG),
        .CE(r_Clock_Count),
        .D(r_Clock_Count__0[4]),
        .Q(r_Clock_Count_reg[4]),
        .R(r_Clock_Count0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clock_Count_reg[5] 
       (.C(sysclk_IBUF_BUFG),
        .CE(r_Clock_Count),
        .D(r_Clock_Count__0[5]),
        .Q(r_Clock_Count_reg[5]),
        .R(r_Clock_Count0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clock_Count_reg[6] 
       (.C(sysclk_IBUF_BUFG),
        .CE(r_Clock_Count),
        .D(r_Clock_Count__0[6]),
        .Q(r_Clock_Count_reg[6]),
        .R(r_Clock_Count0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clock_Count_reg[7] 
       (.C(sysclk_IBUF_BUFG),
        .CE(r_Clock_Count),
        .D(r_Clock_Count__0[7]),
        .Q(r_Clock_Count_reg[7]),
        .R(r_Clock_Count0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clock_Count_reg[8] 
       (.C(sysclk_IBUF_BUFG),
        .CE(r_Clock_Count),
        .D(r_Clock_Count__0[8]),
        .Q(r_Clock_Count_reg[8]),
        .R(r_Clock_Count0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Clock_Count_reg[9] 
       (.C(sysclk_IBUF_BUFG),
        .CE(r_Clock_Count),
        .D(r_Clock_Count__0[9]),
        .Q(r_Clock_Count_reg[9]),
        .R(r_Clock_Count0));
  LUT6 #(
    .INIT(64'hFFFFCFFF0000000A)) 
    r_Tx_Active_i_1
       (.I0(TX_Start),
        .I1(\FSM_sequential_r_SM_Main[2]_i_2_n_0 ),
        .I2(r_SM_Main[1]),
        .I3(r_SM_Main[0]),
        .I4(r_SM_Main[2]),
        .I5(TX_Active),
        .O(r_Tx_Active_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    r_Tx_Active_reg
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(r_Tx_Active_i_1_n_0),
        .Q(TX_Active),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0004)) 
    \r_Tx_Data[7]_i_1 
       (.I0(r_SM_Main[1]),
        .I1(TX_Start),
        .I2(r_SM_Main[0]),
        .I3(r_SM_Main[2]),
        .O(r_Tx_Data_0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Tx_Data_reg[0] 
       (.C(sysclk_IBUF_BUFG),
        .CE(r_Tx_Data_0),
        .D(Q[0]),
        .Q(r_Tx_Data[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Tx_Data_reg[1] 
       (.C(sysclk_IBUF_BUFG),
        .CE(r_Tx_Data_0),
        .D(Q[1]),
        .Q(r_Tx_Data[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Tx_Data_reg[2] 
       (.C(sysclk_IBUF_BUFG),
        .CE(r_Tx_Data_0),
        .D(Q[2]),
        .Q(r_Tx_Data[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Tx_Data_reg[3] 
       (.C(sysclk_IBUF_BUFG),
        .CE(r_Tx_Data_0),
        .D(Q[3]),
        .Q(r_Tx_Data[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Tx_Data_reg[4] 
       (.C(sysclk_IBUF_BUFG),
        .CE(r_Tx_Data_0),
        .D(Q[4]),
        .Q(r_Tx_Data[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Tx_Data_reg[5] 
       (.C(sysclk_IBUF_BUFG),
        .CE(r_Tx_Data_0),
        .D(Q[5]),
        .Q(r_Tx_Data[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Tx_Data_reg[6] 
       (.C(sysclk_IBUF_BUFG),
        .CE(r_Tx_Data_0),
        .D(Q[6]),
        .Q(r_Tx_Data[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \r_Tx_Data_reg[7] 
       (.C(sysclk_IBUF_BUFG),
        .CE(r_Tx_Data_0),
        .D(Q[7]),
        .Q(r_Tx_Data[7]),
        .R(1'b0));
endmodule

(* RX_Mode = "0" *) (* TX_Mode = "1" *) 
(* NotValidForBitStream *)
module UART_Wrapper
   (sysclk,
    uart_txd_in,
    uart_rxd_out);
  input sysclk;
  input uart_txd_in;
  output uart_rxd_out;

  wire RAM_address_bias_i_2_n_0;
  wire RAM_address_bias_i_3_n_0;
  wire RAM_address_bias_reg_n_0;
  wire \RAM_received_address_reg_n_0_[0] ;
  wire \RAM_received_address_reg_n_0_[1] ;
  wire \RAM_received_address_reg_n_0_[2] ;
  wire \RAM_received_address_reg_n_0_[3] ;
  wire RAM_reg_0_15_0_0__0_n_1;
  wire RAM_reg_0_15_0_0__10_n_1;
  wire RAM_reg_0_15_0_0__11_n_1;
  wire RAM_reg_0_15_0_0__12_n_1;
  wire RAM_reg_0_15_0_0__13_n_1;
  wire RAM_reg_0_15_0_0__14_n_1;
  wire RAM_reg_0_15_0_0__1_n_1;
  wire RAM_reg_0_15_0_0__2_n_1;
  wire RAM_reg_0_15_0_0__3_n_1;
  wire RAM_reg_0_15_0_0__4_n_1;
  wire RAM_reg_0_15_0_0__5_n_1;
  wire RAM_reg_0_15_0_0__6_n_1;
  wire RAM_reg_0_15_0_0__7_n_1;
  wire RAM_reg_0_15_0_0__8_n_1;
  wire RAM_reg_0_15_0_0__9_n_1;
  wire RAM_reg_0_15_0_0_n_1;
  wire \RAM_sent_address[0]_i_1_n_0 ;
  wire \RAM_sent_address[3]_i_1_n_0 ;
  wire \RAM_sent_address[3]_i_3_n_0 ;
  wire \RAM_sent_address[3]_i_4_n_0 ;
  wire [3:0]RAM_sent_address_reg;
  wire RX_Done;
  wire TX_Start;
  wire [7:0]TX_data_out;
  wire [15:0]TX_data_out0;
  wire \TX_data_out[0]_i_1_n_0 ;
  wire \TX_data_out[1]_i_1_n_0 ;
  wire \TX_data_out[2]_i_1_n_0 ;
  wire \TX_data_out[3]_i_1_n_0 ;
  wire \TX_data_out[4]_i_1_n_0 ;
  wire \TX_data_out[5]_i_1_n_0 ;
  wire \TX_data_out[6]_i_1_n_0 ;
  wire \TX_data_out[7]_i_2_n_0 ;
  wire UART_RX_n_3;
  wire UART_RX_n_4;
  wire UART_RX_n_5;
  wire UART_RX_n_6;
  wire UART_RX_n_7;
  wire UART_TX_n_1;
  wire UART_TX_n_2;
  wire UART_TX_n_3;
  wire UART_TX_n_4;
  wire UART_TX_n_5;
  wire UART_TX_n_6;
  wire [8:0]p_0_in;
  wire [7:0]r_Rx_Byte;
  wire state_i_1_n_0;
  wire state_i_2_n_0;
  wire state_reg_n_0;
  wire sysclk;
  wire sysclk_IBUF;
  wire sysclk_IBUF_BUFG;
  wire uart_rxd_out;
  wire uart_rxd_out_OBUF;
  wire uart_txd_in;
  wire uart_txd_in_IBUF;

  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    RAM_address_bias_i_2
       (.I0(\RAM_received_address_reg_n_0_[3] ),
        .I1(\RAM_received_address_reg_n_0_[2] ),
        .I2(\RAM_received_address_reg_n_0_[1] ),
        .I3(\RAM_received_address_reg_n_0_[0] ),
        .O(RAM_address_bias_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    RAM_address_bias_i_3
       (.I0(state_reg_n_0),
        .I1(RAM_sent_address_reg[3]),
        .I2(RAM_sent_address_reg[1]),
        .I3(RAM_sent_address_reg[0]),
        .I4(RAM_sent_address_reg[2]),
        .O(RAM_address_bias_i_3_n_0));
  FDRE #(
    .INIT(1'b1)) 
    RAM_address_bias_reg
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(UART_TX_n_6),
        .Q(RAM_address_bias_reg_n_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_received_address_reg[0] 
       (.C(sysclk_IBUF_BUFG),
        .CE(UART_RX_n_3),
        .D(UART_RX_n_7),
        .Q(\RAM_received_address_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_received_address_reg[1] 
       (.C(sysclk_IBUF_BUFG),
        .CE(UART_RX_n_3),
        .D(UART_RX_n_6),
        .Q(\RAM_received_address_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_received_address_reg[2] 
       (.C(sysclk_IBUF_BUFG),
        .CE(UART_RX_n_3),
        .D(UART_RX_n_5),
        .Q(\RAM_received_address_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_received_address_reg[3] 
       (.C(sysclk_IBUF_BUFG),
        .CE(UART_RX_n_3),
        .D(UART_RX_n_4),
        .Q(\RAM_received_address_reg_n_0_[3] ),
        .R(1'b0));
  (* RTL_RAM_BITS = "272" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1D" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "0" *) 
  RAM32X1D #(
    .INIT(32'h00000000)) 
    RAM_reg_0_15_0_0
       (.A0(\RAM_received_address_reg_n_0_[0] ),
        .A1(\RAM_received_address_reg_n_0_[1] ),
        .A2(\RAM_received_address_reg_n_0_[2] ),
        .A3(\RAM_received_address_reg_n_0_[3] ),
        .A4(1'b0),
        .D(r_Rx_Byte[0]),
        .DPO(TX_data_out0[0]),
        .DPRA0(RAM_sent_address_reg[0]),
        .DPRA1(RAM_sent_address_reg[1]),
        .DPRA2(RAM_sent_address_reg[2]),
        .DPRA3(RAM_sent_address_reg[3]),
        .DPRA4(1'b0),
        .SPO(RAM_reg_0_15_0_0_n_1),
        .WCLK(sysclk_IBUF_BUFG),
        .WE(p_0_in[0]));
  (* RTL_RAM_BITS = "272" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1D" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "1" *) 
  (* ram_slice_end = "1" *) 
  RAM32X1D #(
    .INIT(32'h00000000)) 
    RAM_reg_0_15_0_0__0
       (.A0(\RAM_received_address_reg_n_0_[0] ),
        .A1(\RAM_received_address_reg_n_0_[1] ),
        .A2(\RAM_received_address_reg_n_0_[2] ),
        .A3(\RAM_received_address_reg_n_0_[3] ),
        .A4(1'b0),
        .D(r_Rx_Byte[1]),
        .DPO(TX_data_out0[1]),
        .DPRA0(RAM_sent_address_reg[0]),
        .DPRA1(RAM_sent_address_reg[1]),
        .DPRA2(RAM_sent_address_reg[2]),
        .DPRA3(RAM_sent_address_reg[3]),
        .DPRA4(1'b0),
        .SPO(RAM_reg_0_15_0_0__0_n_1),
        .WCLK(sysclk_IBUF_BUFG),
        .WE(p_0_in[0]));
  (* RTL_RAM_BITS = "272" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1D" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "2" *) 
  (* ram_slice_end = "2" *) 
  RAM32X1D #(
    .INIT(32'h00000000)) 
    RAM_reg_0_15_0_0__1
       (.A0(\RAM_received_address_reg_n_0_[0] ),
        .A1(\RAM_received_address_reg_n_0_[1] ),
        .A2(\RAM_received_address_reg_n_0_[2] ),
        .A3(\RAM_received_address_reg_n_0_[3] ),
        .A4(1'b0),
        .D(r_Rx_Byte[2]),
        .DPO(TX_data_out0[2]),
        .DPRA0(RAM_sent_address_reg[0]),
        .DPRA1(RAM_sent_address_reg[1]),
        .DPRA2(RAM_sent_address_reg[2]),
        .DPRA3(RAM_sent_address_reg[3]),
        .DPRA4(1'b0),
        .SPO(RAM_reg_0_15_0_0__1_n_1),
        .WCLK(sysclk_IBUF_BUFG),
        .WE(p_0_in[0]));
  (* RTL_RAM_BITS = "272" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1D" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "11" *) 
  (* ram_slice_end = "11" *) 
  RAM32X1D #(
    .INIT(32'h00000000)) 
    RAM_reg_0_15_0_0__10
       (.A0(\RAM_received_address_reg_n_0_[0] ),
        .A1(\RAM_received_address_reg_n_0_[1] ),
        .A2(\RAM_received_address_reg_n_0_[2] ),
        .A3(\RAM_received_address_reg_n_0_[3] ),
        .A4(1'b0),
        .D(r_Rx_Byte[3]),
        .DPO(TX_data_out0[11]),
        .DPRA0(RAM_sent_address_reg[0]),
        .DPRA1(RAM_sent_address_reg[1]),
        .DPRA2(RAM_sent_address_reg[2]),
        .DPRA3(RAM_sent_address_reg[3]),
        .DPRA4(1'b0),
        .SPO(RAM_reg_0_15_0_0__10_n_1),
        .WCLK(sysclk_IBUF_BUFG),
        .WE(p_0_in[8]));
  (* RTL_RAM_BITS = "272" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1D" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "12" *) 
  RAM32X1D #(
    .INIT(32'h00000000)) 
    RAM_reg_0_15_0_0__11
       (.A0(\RAM_received_address_reg_n_0_[0] ),
        .A1(\RAM_received_address_reg_n_0_[1] ),
        .A2(\RAM_received_address_reg_n_0_[2] ),
        .A3(\RAM_received_address_reg_n_0_[3] ),
        .A4(1'b0),
        .D(r_Rx_Byte[4]),
        .DPO(TX_data_out0[12]),
        .DPRA0(RAM_sent_address_reg[0]),
        .DPRA1(RAM_sent_address_reg[1]),
        .DPRA2(RAM_sent_address_reg[2]),
        .DPRA3(RAM_sent_address_reg[3]),
        .DPRA4(1'b0),
        .SPO(RAM_reg_0_15_0_0__11_n_1),
        .WCLK(sysclk_IBUF_BUFG),
        .WE(p_0_in[8]));
  (* RTL_RAM_BITS = "272" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1D" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "13" *) 
  (* ram_slice_end = "13" *) 
  RAM32X1D #(
    .INIT(32'h00000000)) 
    RAM_reg_0_15_0_0__12
       (.A0(\RAM_received_address_reg_n_0_[0] ),
        .A1(\RAM_received_address_reg_n_0_[1] ),
        .A2(\RAM_received_address_reg_n_0_[2] ),
        .A3(\RAM_received_address_reg_n_0_[3] ),
        .A4(1'b0),
        .D(r_Rx_Byte[5]),
        .DPO(TX_data_out0[13]),
        .DPRA0(RAM_sent_address_reg[0]),
        .DPRA1(RAM_sent_address_reg[1]),
        .DPRA2(RAM_sent_address_reg[2]),
        .DPRA3(RAM_sent_address_reg[3]),
        .DPRA4(1'b0),
        .SPO(RAM_reg_0_15_0_0__12_n_1),
        .WCLK(sysclk_IBUF_BUFG),
        .WE(p_0_in[8]));
  (* RTL_RAM_BITS = "272" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1D" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "14" *) 
  (* ram_slice_end = "14" *) 
  RAM32X1D #(
    .INIT(32'h00000000)) 
    RAM_reg_0_15_0_0__13
       (.A0(\RAM_received_address_reg_n_0_[0] ),
        .A1(\RAM_received_address_reg_n_0_[1] ),
        .A2(\RAM_received_address_reg_n_0_[2] ),
        .A3(\RAM_received_address_reg_n_0_[3] ),
        .A4(1'b0),
        .D(r_Rx_Byte[6]),
        .DPO(TX_data_out0[14]),
        .DPRA0(RAM_sent_address_reg[0]),
        .DPRA1(RAM_sent_address_reg[1]),
        .DPRA2(RAM_sent_address_reg[2]),
        .DPRA3(RAM_sent_address_reg[3]),
        .DPRA4(1'b0),
        .SPO(RAM_reg_0_15_0_0__13_n_1),
        .WCLK(sysclk_IBUF_BUFG),
        .WE(p_0_in[8]));
  (* RTL_RAM_BITS = "272" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1D" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "15" *) 
  (* ram_slice_end = "15" *) 
  RAM32X1D #(
    .INIT(32'h00000000)) 
    RAM_reg_0_15_0_0__14
       (.A0(\RAM_received_address_reg_n_0_[0] ),
        .A1(\RAM_received_address_reg_n_0_[1] ),
        .A2(\RAM_received_address_reg_n_0_[2] ),
        .A3(\RAM_received_address_reg_n_0_[3] ),
        .A4(1'b0),
        .D(r_Rx_Byte[7]),
        .DPO(TX_data_out0[15]),
        .DPRA0(RAM_sent_address_reg[0]),
        .DPRA1(RAM_sent_address_reg[1]),
        .DPRA2(RAM_sent_address_reg[2]),
        .DPRA3(RAM_sent_address_reg[3]),
        .DPRA4(1'b0),
        .SPO(RAM_reg_0_15_0_0__14_n_1),
        .WCLK(sysclk_IBUF_BUFG),
        .WE(p_0_in[8]));
  (* RTL_RAM_BITS = "272" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1D" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "3" *) 
  RAM32X1D #(
    .INIT(32'h00000000)) 
    RAM_reg_0_15_0_0__2
       (.A0(\RAM_received_address_reg_n_0_[0] ),
        .A1(\RAM_received_address_reg_n_0_[1] ),
        .A2(\RAM_received_address_reg_n_0_[2] ),
        .A3(\RAM_received_address_reg_n_0_[3] ),
        .A4(1'b0),
        .D(r_Rx_Byte[3]),
        .DPO(TX_data_out0[3]),
        .DPRA0(RAM_sent_address_reg[0]),
        .DPRA1(RAM_sent_address_reg[1]),
        .DPRA2(RAM_sent_address_reg[2]),
        .DPRA3(RAM_sent_address_reg[3]),
        .DPRA4(1'b0),
        .SPO(RAM_reg_0_15_0_0__2_n_1),
        .WCLK(sysclk_IBUF_BUFG),
        .WE(p_0_in[0]));
  (* RTL_RAM_BITS = "272" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1D" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "4" *) 
  (* ram_slice_end = "4" *) 
  RAM32X1D #(
    .INIT(32'h00000000)) 
    RAM_reg_0_15_0_0__3
       (.A0(\RAM_received_address_reg_n_0_[0] ),
        .A1(\RAM_received_address_reg_n_0_[1] ),
        .A2(\RAM_received_address_reg_n_0_[2] ),
        .A3(\RAM_received_address_reg_n_0_[3] ),
        .A4(1'b0),
        .D(r_Rx_Byte[4]),
        .DPO(TX_data_out0[4]),
        .DPRA0(RAM_sent_address_reg[0]),
        .DPRA1(RAM_sent_address_reg[1]),
        .DPRA2(RAM_sent_address_reg[2]),
        .DPRA3(RAM_sent_address_reg[3]),
        .DPRA4(1'b0),
        .SPO(RAM_reg_0_15_0_0__3_n_1),
        .WCLK(sysclk_IBUF_BUFG),
        .WE(p_0_in[0]));
  (* RTL_RAM_BITS = "272" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1D" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "5" *) 
  (* ram_slice_end = "5" *) 
  RAM32X1D #(
    .INIT(32'h00000000)) 
    RAM_reg_0_15_0_0__4
       (.A0(\RAM_received_address_reg_n_0_[0] ),
        .A1(\RAM_received_address_reg_n_0_[1] ),
        .A2(\RAM_received_address_reg_n_0_[2] ),
        .A3(\RAM_received_address_reg_n_0_[3] ),
        .A4(1'b0),
        .D(r_Rx_Byte[5]),
        .DPO(TX_data_out0[5]),
        .DPRA0(RAM_sent_address_reg[0]),
        .DPRA1(RAM_sent_address_reg[1]),
        .DPRA2(RAM_sent_address_reg[2]),
        .DPRA3(RAM_sent_address_reg[3]),
        .DPRA4(1'b0),
        .SPO(RAM_reg_0_15_0_0__4_n_1),
        .WCLK(sysclk_IBUF_BUFG),
        .WE(p_0_in[0]));
  (* RTL_RAM_BITS = "272" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1D" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM32X1D #(
    .INIT(32'h00000000)) 
    RAM_reg_0_15_0_0__5
       (.A0(\RAM_received_address_reg_n_0_[0] ),
        .A1(\RAM_received_address_reg_n_0_[1] ),
        .A2(\RAM_received_address_reg_n_0_[2] ),
        .A3(\RAM_received_address_reg_n_0_[3] ),
        .A4(1'b0),
        .D(r_Rx_Byte[6]),
        .DPO(TX_data_out0[6]),
        .DPRA0(RAM_sent_address_reg[0]),
        .DPRA1(RAM_sent_address_reg[1]),
        .DPRA2(RAM_sent_address_reg[2]),
        .DPRA3(RAM_sent_address_reg[3]),
        .DPRA4(1'b0),
        .SPO(RAM_reg_0_15_0_0__5_n_1),
        .WCLK(sysclk_IBUF_BUFG),
        .WE(p_0_in[0]));
  (* RTL_RAM_BITS = "272" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1D" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM32X1D #(
    .INIT(32'h00000000)) 
    RAM_reg_0_15_0_0__6
       (.A0(\RAM_received_address_reg_n_0_[0] ),
        .A1(\RAM_received_address_reg_n_0_[1] ),
        .A2(\RAM_received_address_reg_n_0_[2] ),
        .A3(\RAM_received_address_reg_n_0_[3] ),
        .A4(1'b0),
        .D(r_Rx_Byte[7]),
        .DPO(TX_data_out0[7]),
        .DPRA0(RAM_sent_address_reg[0]),
        .DPRA1(RAM_sent_address_reg[1]),
        .DPRA2(RAM_sent_address_reg[2]),
        .DPRA3(RAM_sent_address_reg[3]),
        .DPRA4(1'b0),
        .SPO(RAM_reg_0_15_0_0__6_n_1),
        .WCLK(sysclk_IBUF_BUFG),
        .WE(p_0_in[0]));
  (* RTL_RAM_BITS = "272" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1D" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "8" *) 
  (* ram_slice_end = "8" *) 
  RAM32X1D #(
    .INIT(32'h00000000)) 
    RAM_reg_0_15_0_0__7
       (.A0(\RAM_received_address_reg_n_0_[0] ),
        .A1(\RAM_received_address_reg_n_0_[1] ),
        .A2(\RAM_received_address_reg_n_0_[2] ),
        .A3(\RAM_received_address_reg_n_0_[3] ),
        .A4(1'b0),
        .D(r_Rx_Byte[0]),
        .DPO(TX_data_out0[8]),
        .DPRA0(RAM_sent_address_reg[0]),
        .DPRA1(RAM_sent_address_reg[1]),
        .DPRA2(RAM_sent_address_reg[2]),
        .DPRA3(RAM_sent_address_reg[3]),
        .DPRA4(1'b0),
        .SPO(RAM_reg_0_15_0_0__7_n_1),
        .WCLK(sysclk_IBUF_BUFG),
        .WE(p_0_in[8]));
  (* RTL_RAM_BITS = "272" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1D" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "9" *) 
  (* ram_slice_end = "9" *) 
  RAM32X1D #(
    .INIT(32'h00000000)) 
    RAM_reg_0_15_0_0__8
       (.A0(\RAM_received_address_reg_n_0_[0] ),
        .A1(\RAM_received_address_reg_n_0_[1] ),
        .A2(\RAM_received_address_reg_n_0_[2] ),
        .A3(\RAM_received_address_reg_n_0_[3] ),
        .A4(1'b0),
        .D(r_Rx_Byte[1]),
        .DPO(TX_data_out0[9]),
        .DPRA0(RAM_sent_address_reg[0]),
        .DPRA1(RAM_sent_address_reg[1]),
        .DPRA2(RAM_sent_address_reg[2]),
        .DPRA3(RAM_sent_address_reg[3]),
        .DPRA4(1'b0),
        .SPO(RAM_reg_0_15_0_0__8_n_1),
        .WCLK(sysclk_IBUF_BUFG),
        .WE(p_0_in[8]));
  (* RTL_RAM_BITS = "272" *) 
  (* RTL_RAM_NAME = "RAM" *) 
  (* XILINX_LEGACY_PRIM = "RAM16X1D" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "15" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "10" *) 
  (* ram_slice_end = "10" *) 
  RAM32X1D #(
    .INIT(32'h00000000)) 
    RAM_reg_0_15_0_0__9
       (.A0(\RAM_received_address_reg_n_0_[0] ),
        .A1(\RAM_received_address_reg_n_0_[1] ),
        .A2(\RAM_received_address_reg_n_0_[2] ),
        .A3(\RAM_received_address_reg_n_0_[3] ),
        .A4(1'b0),
        .D(r_Rx_Byte[2]),
        .DPO(TX_data_out0[10]),
        .DPRA0(RAM_sent_address_reg[0]),
        .DPRA1(RAM_sent_address_reg[1]),
        .DPRA2(RAM_sent_address_reg[2]),
        .DPRA3(RAM_sent_address_reg[3]),
        .DPRA4(1'b0),
        .SPO(RAM_reg_0_15_0_0__9_n_1),
        .WCLK(sysclk_IBUF_BUFG),
        .WE(p_0_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \RAM_sent_address[0]_i_1 
       (.I0(RAM_sent_address_reg[0]),
        .O(\RAM_sent_address[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h4)) 
    \RAM_sent_address[3]_i_1 
       (.I0(\RAM_sent_address[3]_i_4_n_0 ),
        .I1(state_reg_n_0),
        .O(\RAM_sent_address[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'hEAAA)) 
    \RAM_sent_address[3]_i_3 
       (.I0(RAM_sent_address_reg[3]),
        .I1(RAM_sent_address_reg[2]),
        .I2(RAM_sent_address_reg[0]),
        .I3(RAM_sent_address_reg[1]),
        .O(\RAM_sent_address[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \RAM_sent_address[3]_i_4 
       (.I0(RAM_sent_address_reg[2]),
        .I1(RAM_sent_address_reg[0]),
        .I2(RAM_sent_address_reg[1]),
        .I3(RAM_sent_address_reg[3]),
        .O(\RAM_sent_address[3]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_sent_address_reg[0] 
       (.C(sysclk_IBUF_BUFG),
        .CE(UART_TX_n_1),
        .D(\RAM_sent_address[0]_i_1_n_0 ),
        .Q(RAM_sent_address_reg[0]),
        .R(\RAM_sent_address[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_sent_address_reg[1] 
       (.C(sysclk_IBUF_BUFG),
        .CE(UART_TX_n_1),
        .D(UART_TX_n_4),
        .Q(RAM_sent_address_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_sent_address_reg[2] 
       (.C(sysclk_IBUF_BUFG),
        .CE(UART_TX_n_1),
        .D(UART_TX_n_3),
        .Q(RAM_sent_address_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \RAM_sent_address_reg[3] 
       (.C(sysclk_IBUF_BUFG),
        .CE(UART_TX_n_1),
        .D(\RAM_sent_address[3]_i_3_n_0 ),
        .Q(RAM_sent_address_reg[3]),
        .R(\RAM_sent_address[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    TX_Start_reg
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(UART_TX_n_5),
        .Q(TX_Start),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \TX_data_out[0]_i_1 
       (.I0(TX_data_out0[8]),
        .I1(RAM_address_bias_reg_n_0),
        .I2(TX_data_out0[0]),
        .O(\TX_data_out[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \TX_data_out[1]_i_1 
       (.I0(TX_data_out0[9]),
        .I1(RAM_address_bias_reg_n_0),
        .I2(TX_data_out0[1]),
        .O(\TX_data_out[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \TX_data_out[2]_i_1 
       (.I0(TX_data_out0[10]),
        .I1(RAM_address_bias_reg_n_0),
        .I2(TX_data_out0[2]),
        .O(\TX_data_out[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \TX_data_out[3]_i_1 
       (.I0(TX_data_out0[11]),
        .I1(RAM_address_bias_reg_n_0),
        .I2(TX_data_out0[3]),
        .O(\TX_data_out[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \TX_data_out[4]_i_1 
       (.I0(TX_data_out0[12]),
        .I1(RAM_address_bias_reg_n_0),
        .I2(TX_data_out0[4]),
        .O(\TX_data_out[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \TX_data_out[5]_i_1 
       (.I0(TX_data_out0[13]),
        .I1(RAM_address_bias_reg_n_0),
        .I2(TX_data_out0[5]),
        .O(\TX_data_out[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \TX_data_out[6]_i_1 
       (.I0(TX_data_out0[14]),
        .I1(RAM_address_bias_reg_n_0),
        .I2(TX_data_out0[6]),
        .O(\TX_data_out[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \TX_data_out[7]_i_2 
       (.I0(TX_data_out0[15]),
        .I1(RAM_address_bias_reg_n_0),
        .I2(TX_data_out0[7]),
        .O(\TX_data_out[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \TX_data_out_reg[0] 
       (.C(sysclk_IBUF_BUFG),
        .CE(UART_TX_n_2),
        .D(\TX_data_out[0]_i_1_n_0 ),
        .Q(TX_data_out[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TX_data_out_reg[1] 
       (.C(sysclk_IBUF_BUFG),
        .CE(UART_TX_n_2),
        .D(\TX_data_out[1]_i_1_n_0 ),
        .Q(TX_data_out[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TX_data_out_reg[2] 
       (.C(sysclk_IBUF_BUFG),
        .CE(UART_TX_n_2),
        .D(\TX_data_out[2]_i_1_n_0 ),
        .Q(TX_data_out[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TX_data_out_reg[3] 
       (.C(sysclk_IBUF_BUFG),
        .CE(UART_TX_n_2),
        .D(\TX_data_out[3]_i_1_n_0 ),
        .Q(TX_data_out[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TX_data_out_reg[4] 
       (.C(sysclk_IBUF_BUFG),
        .CE(UART_TX_n_2),
        .D(\TX_data_out[4]_i_1_n_0 ),
        .Q(TX_data_out[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TX_data_out_reg[5] 
       (.C(sysclk_IBUF_BUFG),
        .CE(UART_TX_n_2),
        .D(\TX_data_out[5]_i_1_n_0 ),
        .Q(TX_data_out[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TX_data_out_reg[6] 
       (.C(sysclk_IBUF_BUFG),
        .CE(UART_TX_n_2),
        .D(\TX_data_out[6]_i_1_n_0 ),
        .Q(TX_data_out[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \TX_data_out_reg[7] 
       (.C(sysclk_IBUF_BUFG),
        .CE(UART_TX_n_2),
        .D(\TX_data_out[7]_i_2_n_0 ),
        .Q(TX_data_out[7]),
        .R(1'b0));
  UART_RX UART_RX
       (.D({UART_RX_n_4,UART_RX_n_5,UART_RX_n_6,UART_RX_n_7}),
        .E(UART_RX_n_3),
        .Q({\RAM_received_address_reg_n_0_[3] ,\RAM_received_address_reg_n_0_[2] ,\RAM_received_address_reg_n_0_[1] ,\RAM_received_address_reg_n_0_[0] }),
        .\RAM_received_address_reg[0] (RAM_address_bias_reg_n_0),
        .\RAM_received_address_reg[0]_0 (state_reg_n_0),
        .RX_Done(RX_Done),
        .p_0_in({p_0_in[8],p_0_in[0]}),
        .p_1_in(r_Rx_Byte),
        .sysclk_IBUF_BUFG(sysclk_IBUF_BUFG),
        .uart_txd_in_IBUF(uart_txd_in_IBUF));
  UART_TX UART_TX
       (.E(UART_TX_n_2),
        .Q(TX_data_out),
        .RAM_address_bias_reg(UART_TX_n_1),
        .RAM_address_bias_reg_0(RAM_address_bias_i_2_n_0),
        .RAM_address_bias_reg_1(RAM_address_bias_i_3_n_0),
        .RAM_sent_address_reg(RAM_sent_address_reg),
        .\RAM_sent_address_reg[0]_0 (RAM_address_bias_reg_n_0),
        .\RAM_sent_address_reg[0]_1 (\RAM_sent_address[3]_i_4_n_0 ),
        .RAM_sent_address_reg_0_sp_1(UART_TX_n_3),
        .RAM_sent_address_reg_1_sp_1(UART_TX_n_4),
        .RX_Done(RX_Done),
        .TX_Start(TX_Start),
        .TX_Start_reg(state_reg_n_0),
        .state_reg(UART_TX_n_5),
        .state_reg_0(UART_TX_n_6),
        .sysclk_IBUF_BUFG(sysclk_IBUF_BUFG),
        .uart_rxd_out_OBUF(uart_rxd_out_OBUF));
  LUT6 #(
    .INIT(64'h15555555AAAAAAAA)) 
    state_i_1
       (.I0(state_i_2_n_0),
        .I1(RAM_sent_address_reg[3]),
        .I2(RAM_sent_address_reg[1]),
        .I3(RAM_sent_address_reg[0]),
        .I4(RAM_sent_address_reg[2]),
        .I5(state_reg_n_0),
        .O(state_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'h00008000)) 
    state_i_2
       (.I0(\RAM_received_address_reg_n_0_[0] ),
        .I1(\RAM_received_address_reg_n_0_[1] ),
        .I2(\RAM_received_address_reg_n_0_[2] ),
        .I3(\RAM_received_address_reg_n_0_[3] ),
        .I4(state_reg_n_0),
        .O(state_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    state_reg
       (.C(sysclk_IBUF_BUFG),
        .CE(1'b1),
        .D(state_i_1_n_0),
        .Q(state_reg_n_0),
        .R(1'b0));
  BUFG sysclk_IBUF_BUFG_inst
       (.I(sysclk_IBUF),
        .O(sysclk_IBUF_BUFG));
  IBUF sysclk_IBUF_inst
       (.I(sysclk),
        .O(sysclk_IBUF));
  OBUF uart_rxd_out_OBUF_inst
       (.I(uart_rxd_out_OBUF),
        .O(uart_rxd_out));
  IBUF uart_txd_in_IBUF_inst
       (.I(uart_txd_in),
        .O(uart_txd_in_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
