//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2011, VIPcore Group, Fudan University
//
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//
//  VIPcore       : http://soc.fudan.edu.cn/vip
//  IP Owner    : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn
//-------------------------------------------------------------------
// Filename       : bs_dump.v
// Author         : fanyibo
// Created        : 2014-07-11
// Description    : dump bit stream
//
// $Id$
//-------------------------------------------------------------------
`ifdef DUMP_BS

integer f_bs;
integer bs_num;
initial begin
  bs_num = 0;
  f_bs = $fopen("./dump/bs.dat","wb");
end

always @(frame_num)
  $fdisplay(f_bs, "\nFrame Number =%3d", frame_num);

always @(posedge clk) begin
  if (dut.u_top.winc_o) begin
    bs_num = bs_num + 1;
    $fwrite(f_bs, "%h ", dut.u_top.wdata_o);
    if (!(bs_num%16)) $fdisplay(f_bs, ";");
//    if (u_top.frame_done) begin
//      $fwrite(f_bs, "\n");
//      bs_num = 0;
//    end
  end
end

`endif