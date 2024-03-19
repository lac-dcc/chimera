// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_CMAC_CORE_mac.v
// ================================================================
// NVDLA Open Source Project
// 
// Copyright(c) 2016 - 2017 NVIDIA Corporation.  Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with 
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_CMAC.h
module NV_NVDLA_CMAC_CORE_mac (
   nvdla_core_clk //|< i
  ,nvdla_wg_clk //|< i
  ,nvdla_core_rstn //|< i
  ,cfg_is_wg //|< i
  ,cfg_reg_en //|< i
  ,dat_actv_data //|< i
  ,dat_actv_nz //|< i
  ,dat_actv_pvld //|< i
  ,wt_actv_data //|< i
  ,wt_actv_nz //|< i
  ,wt_actv_pvld //|< i
  ,mac_out_data //|> o
  ,mac_out_pvld //|> o
  );
input nvdla_core_clk;
input nvdla_wg_clk;
input nvdla_core_rstn;
input cfg_is_wg;
input cfg_reg_en;
input [64*8 -1:0] dat_actv_data;
input [64 -1:0] dat_actv_nz;
input [64 -1:0] dat_actv_pvld;
input [64*8 -1:0] wt_actv_data;
input [64 -1:0] wt_actv_nz;
input [64 -1:0] wt_actv_pvld;
output [22 -1:0] mac_out_data;
output mac_out_pvld;
////////////////// unpack data&nz //////////////
//: for(my $i=0; $i<64; $i++){
//: my $bpe = 8;
//: my $data_msb = ($i+1) * $bpe - 1;
//: my $data_lsb = $i * $bpe;
//: print qq(
//: wire [${bpe}-1:0] wt_actv_data${i} = wt_actv_data[${data_msb}:${data_lsb}];
//: wire [${bpe}-1:0] dat_actv_data${i} = dat_actv_data[${data_msb}:${data_lsb}];
//: wire wt_actv_nz${i} = wt_actv_nz[${i}];
//: wire dat_actv_nz${i} = dat_actv_nz[${i}];
//: )
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

wire [8-1:0] wt_actv_data0 = wt_actv_data[7:0];
wire [8-1:0] dat_actv_data0 = dat_actv_data[7:0];
wire wt_actv_nz0 = wt_actv_nz[0];
wire dat_actv_nz0 = dat_actv_nz[0];

wire [8-1:0] wt_actv_data1 = wt_actv_data[15:8];
wire [8-1:0] dat_actv_data1 = dat_actv_data[15:8];
wire wt_actv_nz1 = wt_actv_nz[1];
wire dat_actv_nz1 = dat_actv_nz[1];

wire [8-1:0] wt_actv_data2 = wt_actv_data[23:16];
wire [8-1:0] dat_actv_data2 = dat_actv_data[23:16];
wire wt_actv_nz2 = wt_actv_nz[2];
wire dat_actv_nz2 = dat_actv_nz[2];

wire [8-1:0] wt_actv_data3 = wt_actv_data[31:24];
wire [8-1:0] dat_actv_data3 = dat_actv_data[31:24];
wire wt_actv_nz3 = wt_actv_nz[3];
wire dat_actv_nz3 = dat_actv_nz[3];

wire [8-1:0] wt_actv_data4 = wt_actv_data[39:32];
wire [8-1:0] dat_actv_data4 = dat_actv_data[39:32];
wire wt_actv_nz4 = wt_actv_nz[4];
wire dat_actv_nz4 = dat_actv_nz[4];

wire [8-1:0] wt_actv_data5 = wt_actv_data[47:40];
wire [8-1:0] dat_actv_data5 = dat_actv_data[47:40];
wire wt_actv_nz5 = wt_actv_nz[5];
wire dat_actv_nz5 = dat_actv_nz[5];

wire [8-1:0] wt_actv_data6 = wt_actv_data[55:48];
wire [8-1:0] dat_actv_data6 = dat_actv_data[55:48];
wire wt_actv_nz6 = wt_actv_nz[6];
wire dat_actv_nz6 = dat_actv_nz[6];

wire [8-1:0] wt_actv_data7 = wt_actv_data[63:56];
wire [8-1:0] dat_actv_data7 = dat_actv_data[63:56];
wire wt_actv_nz7 = wt_actv_nz[7];
wire dat_actv_nz7 = dat_actv_nz[7];

wire [8-1:0] wt_actv_data8 = wt_actv_data[71:64];
wire [8-1:0] dat_actv_data8 = dat_actv_data[71:64];
wire wt_actv_nz8 = wt_actv_nz[8];
wire dat_actv_nz8 = dat_actv_nz[8];

wire [8-1:0] wt_actv_data9 = wt_actv_data[79:72];
wire [8-1:0] dat_actv_data9 = dat_actv_data[79:72];
wire wt_actv_nz9 = wt_actv_nz[9];
wire dat_actv_nz9 = dat_actv_nz[9];

wire [8-1:0] wt_actv_data10 = wt_actv_data[87:80];
wire [8-1:0] dat_actv_data10 = dat_actv_data[87:80];
wire wt_actv_nz10 = wt_actv_nz[10];
wire dat_actv_nz10 = dat_actv_nz[10];

wire [8-1:0] wt_actv_data11 = wt_actv_data[95:88];
wire [8-1:0] dat_actv_data11 = dat_actv_data[95:88];
wire wt_actv_nz11 = wt_actv_nz[11];
wire dat_actv_nz11 = dat_actv_nz[11];

wire [8-1:0] wt_actv_data12 = wt_actv_data[103:96];
wire [8-1:0] dat_actv_data12 = dat_actv_data[103:96];
wire wt_actv_nz12 = wt_actv_nz[12];
wire dat_actv_nz12 = dat_actv_nz[12];

wire [8-1:0] wt_actv_data13 = wt_actv_data[111:104];
wire [8-1:0] dat_actv_data13 = dat_actv_data[111:104];
wire wt_actv_nz13 = wt_actv_nz[13];
wire dat_actv_nz13 = dat_actv_nz[13];

wire [8-1:0] wt_actv_data14 = wt_actv_data[119:112];
wire [8-1:0] dat_actv_data14 = dat_actv_data[119:112];
wire wt_actv_nz14 = wt_actv_nz[14];
wire dat_actv_nz14 = dat_actv_nz[14];

wire [8-1:0] wt_actv_data15 = wt_actv_data[127:120];
wire [8-1:0] dat_actv_data15 = dat_actv_data[127:120];
wire wt_actv_nz15 = wt_actv_nz[15];
wire dat_actv_nz15 = dat_actv_nz[15];

wire [8-1:0] wt_actv_data16 = wt_actv_data[135:128];
wire [8-1:0] dat_actv_data16 = dat_actv_data[135:128];
wire wt_actv_nz16 = wt_actv_nz[16];
wire dat_actv_nz16 = dat_actv_nz[16];

wire [8-1:0] wt_actv_data17 = wt_actv_data[143:136];
wire [8-1:0] dat_actv_data17 = dat_actv_data[143:136];
wire wt_actv_nz17 = wt_actv_nz[17];
wire dat_actv_nz17 = dat_actv_nz[17];

wire [8-1:0] wt_actv_data18 = wt_actv_data[151:144];
wire [8-1:0] dat_actv_data18 = dat_actv_data[151:144];
wire wt_actv_nz18 = wt_actv_nz[18];
wire dat_actv_nz18 = dat_actv_nz[18];

wire [8-1:0] wt_actv_data19 = wt_actv_data[159:152];
wire [8-1:0] dat_actv_data19 = dat_actv_data[159:152];
wire wt_actv_nz19 = wt_actv_nz[19];
wire dat_actv_nz19 = dat_actv_nz[19];

wire [8-1:0] wt_actv_data20 = wt_actv_data[167:160];
wire [8-1:0] dat_actv_data20 = dat_actv_data[167:160];
wire wt_actv_nz20 = wt_actv_nz[20];
wire dat_actv_nz20 = dat_actv_nz[20];

wire [8-1:0] wt_actv_data21 = wt_actv_data[175:168];
wire [8-1:0] dat_actv_data21 = dat_actv_data[175:168];
wire wt_actv_nz21 = wt_actv_nz[21];
wire dat_actv_nz21 = dat_actv_nz[21];

wire [8-1:0] wt_actv_data22 = wt_actv_data[183:176];
wire [8-1:0] dat_actv_data22 = dat_actv_data[183:176];
wire wt_actv_nz22 = wt_actv_nz[22];
wire dat_actv_nz22 = dat_actv_nz[22];

wire [8-1:0] wt_actv_data23 = wt_actv_data[191:184];
wire [8-1:0] dat_actv_data23 = dat_actv_data[191:184];
wire wt_actv_nz23 = wt_actv_nz[23];
wire dat_actv_nz23 = dat_actv_nz[23];

wire [8-1:0] wt_actv_data24 = wt_actv_data[199:192];
wire [8-1:0] dat_actv_data24 = dat_actv_data[199:192];
wire wt_actv_nz24 = wt_actv_nz[24];
wire dat_actv_nz24 = dat_actv_nz[24];

wire [8-1:0] wt_actv_data25 = wt_actv_data[207:200];
wire [8-1:0] dat_actv_data25 = dat_actv_data[207:200];
wire wt_actv_nz25 = wt_actv_nz[25];
wire dat_actv_nz25 = dat_actv_nz[25];

wire [8-1:0] wt_actv_data26 = wt_actv_data[215:208];
wire [8-1:0] dat_actv_data26 = dat_actv_data[215:208];
wire wt_actv_nz26 = wt_actv_nz[26];
wire dat_actv_nz26 = dat_actv_nz[26];

wire [8-1:0] wt_actv_data27 = wt_actv_data[223:216];
wire [8-1:0] dat_actv_data27 = dat_actv_data[223:216];
wire wt_actv_nz27 = wt_actv_nz[27];
wire dat_actv_nz27 = dat_actv_nz[27];

wire [8-1:0] wt_actv_data28 = wt_actv_data[231:224];
wire [8-1:0] dat_actv_data28 = dat_actv_data[231:224];
wire wt_actv_nz28 = wt_actv_nz[28];
wire dat_actv_nz28 = dat_actv_nz[28];

wire [8-1:0] wt_actv_data29 = wt_actv_data[239:232];
wire [8-1:0] dat_actv_data29 = dat_actv_data[239:232];
wire wt_actv_nz29 = wt_actv_nz[29];
wire dat_actv_nz29 = dat_actv_nz[29];

wire [8-1:0] wt_actv_data30 = wt_actv_data[247:240];
wire [8-1:0] dat_actv_data30 = dat_actv_data[247:240];
wire wt_actv_nz30 = wt_actv_nz[30];
wire dat_actv_nz30 = dat_actv_nz[30];

wire [8-1:0] wt_actv_data31 = wt_actv_data[255:248];
wire [8-1:0] dat_actv_data31 = dat_actv_data[255:248];
wire wt_actv_nz31 = wt_actv_nz[31];
wire dat_actv_nz31 = dat_actv_nz[31];

wire [8-1:0] wt_actv_data32 = wt_actv_data[263:256];
wire [8-1:0] dat_actv_data32 = dat_actv_data[263:256];
wire wt_actv_nz32 = wt_actv_nz[32];
wire dat_actv_nz32 = dat_actv_nz[32];

wire [8-1:0] wt_actv_data33 = wt_actv_data[271:264];
wire [8-1:0] dat_actv_data33 = dat_actv_data[271:264];
wire wt_actv_nz33 = wt_actv_nz[33];
wire dat_actv_nz33 = dat_actv_nz[33];

wire [8-1:0] wt_actv_data34 = wt_actv_data[279:272];
wire [8-1:0] dat_actv_data34 = dat_actv_data[279:272];
wire wt_actv_nz34 = wt_actv_nz[34];
wire dat_actv_nz34 = dat_actv_nz[34];

wire [8-1:0] wt_actv_data35 = wt_actv_data[287:280];
wire [8-1:0] dat_actv_data35 = dat_actv_data[287:280];
wire wt_actv_nz35 = wt_actv_nz[35];
wire dat_actv_nz35 = dat_actv_nz[35];

wire [8-1:0] wt_actv_data36 = wt_actv_data[295:288];
wire [8-1:0] dat_actv_data36 = dat_actv_data[295:288];
wire wt_actv_nz36 = wt_actv_nz[36];
wire dat_actv_nz36 = dat_actv_nz[36];

wire [8-1:0] wt_actv_data37 = wt_actv_data[303:296];
wire [8-1:0] dat_actv_data37 = dat_actv_data[303:296];
wire wt_actv_nz37 = wt_actv_nz[37];
wire dat_actv_nz37 = dat_actv_nz[37];

wire [8-1:0] wt_actv_data38 = wt_actv_data[311:304];
wire [8-1:0] dat_actv_data38 = dat_actv_data[311:304];
wire wt_actv_nz38 = wt_actv_nz[38];
wire dat_actv_nz38 = dat_actv_nz[38];

wire [8-1:0] wt_actv_data39 = wt_actv_data[319:312];
wire [8-1:0] dat_actv_data39 = dat_actv_data[319:312];
wire wt_actv_nz39 = wt_actv_nz[39];
wire dat_actv_nz39 = dat_actv_nz[39];

wire [8-1:0] wt_actv_data40 = wt_actv_data[327:320];
wire [8-1:0] dat_actv_data40 = dat_actv_data[327:320];
wire wt_actv_nz40 = wt_actv_nz[40];
wire dat_actv_nz40 = dat_actv_nz[40];

wire [8-1:0] wt_actv_data41 = wt_actv_data[335:328];
wire [8-1:0] dat_actv_data41 = dat_actv_data[335:328];
wire wt_actv_nz41 = wt_actv_nz[41];
wire dat_actv_nz41 = dat_actv_nz[41];

wire [8-1:0] wt_actv_data42 = wt_actv_data[343:336];
wire [8-1:0] dat_actv_data42 = dat_actv_data[343:336];
wire wt_actv_nz42 = wt_actv_nz[42];
wire dat_actv_nz42 = dat_actv_nz[42];

wire [8-1:0] wt_actv_data43 = wt_actv_data[351:344];
wire [8-1:0] dat_actv_data43 = dat_actv_data[351:344];
wire wt_actv_nz43 = wt_actv_nz[43];
wire dat_actv_nz43 = dat_actv_nz[43];

wire [8-1:0] wt_actv_data44 = wt_actv_data[359:352];
wire [8-1:0] dat_actv_data44 = dat_actv_data[359:352];
wire wt_actv_nz44 = wt_actv_nz[44];
wire dat_actv_nz44 = dat_actv_nz[44];

wire [8-1:0] wt_actv_data45 = wt_actv_data[367:360];
wire [8-1:0] dat_actv_data45 = dat_actv_data[367:360];
wire wt_actv_nz45 = wt_actv_nz[45];
wire dat_actv_nz45 = dat_actv_nz[45];

wire [8-1:0] wt_actv_data46 = wt_actv_data[375:368];
wire [8-1:0] dat_actv_data46 = dat_actv_data[375:368];
wire wt_actv_nz46 = wt_actv_nz[46];
wire dat_actv_nz46 = dat_actv_nz[46];

wire [8-1:0] wt_actv_data47 = wt_actv_data[383:376];
wire [8-1:0] dat_actv_data47 = dat_actv_data[383:376];
wire wt_actv_nz47 = wt_actv_nz[47];
wire dat_actv_nz47 = dat_actv_nz[47];

wire [8-1:0] wt_actv_data48 = wt_actv_data[391:384];
wire [8-1:0] dat_actv_data48 = dat_actv_data[391:384];
wire wt_actv_nz48 = wt_actv_nz[48];
wire dat_actv_nz48 = dat_actv_nz[48];

wire [8-1:0] wt_actv_data49 = wt_actv_data[399:392];
wire [8-1:0] dat_actv_data49 = dat_actv_data[399:392];
wire wt_actv_nz49 = wt_actv_nz[49];
wire dat_actv_nz49 = dat_actv_nz[49];

wire [8-1:0] wt_actv_data50 = wt_actv_data[407:400];
wire [8-1:0] dat_actv_data50 = dat_actv_data[407:400];
wire wt_actv_nz50 = wt_actv_nz[50];
wire dat_actv_nz50 = dat_actv_nz[50];

wire [8-1:0] wt_actv_data51 = wt_actv_data[415:408];
wire [8-1:0] dat_actv_data51 = dat_actv_data[415:408];
wire wt_actv_nz51 = wt_actv_nz[51];
wire dat_actv_nz51 = dat_actv_nz[51];

wire [8-1:0] wt_actv_data52 = wt_actv_data[423:416];
wire [8-1:0] dat_actv_data52 = dat_actv_data[423:416];
wire wt_actv_nz52 = wt_actv_nz[52];
wire dat_actv_nz52 = dat_actv_nz[52];

wire [8-1:0] wt_actv_data53 = wt_actv_data[431:424];
wire [8-1:0] dat_actv_data53 = dat_actv_data[431:424];
wire wt_actv_nz53 = wt_actv_nz[53];
wire dat_actv_nz53 = dat_actv_nz[53];

wire [8-1:0] wt_actv_data54 = wt_actv_data[439:432];
wire [8-1:0] dat_actv_data54 = dat_actv_data[439:432];
wire wt_actv_nz54 = wt_actv_nz[54];
wire dat_actv_nz54 = dat_actv_nz[54];

wire [8-1:0] wt_actv_data55 = wt_actv_data[447:440];
wire [8-1:0] dat_actv_data55 = dat_actv_data[447:440];
wire wt_actv_nz55 = wt_actv_nz[55];
wire dat_actv_nz55 = dat_actv_nz[55];

wire [8-1:0] wt_actv_data56 = wt_actv_data[455:448];
wire [8-1:0] dat_actv_data56 = dat_actv_data[455:448];
wire wt_actv_nz56 = wt_actv_nz[56];
wire dat_actv_nz56 = dat_actv_nz[56];

wire [8-1:0] wt_actv_data57 = wt_actv_data[463:456];
wire [8-1:0] dat_actv_data57 = dat_actv_data[463:456];
wire wt_actv_nz57 = wt_actv_nz[57];
wire dat_actv_nz57 = dat_actv_nz[57];

wire [8-1:0] wt_actv_data58 = wt_actv_data[471:464];
wire [8-1:0] dat_actv_data58 = dat_actv_data[471:464];
wire wt_actv_nz58 = wt_actv_nz[58];
wire dat_actv_nz58 = dat_actv_nz[58];

wire [8-1:0] wt_actv_data59 = wt_actv_data[479:472];
wire [8-1:0] dat_actv_data59 = dat_actv_data[479:472];
wire wt_actv_nz59 = wt_actv_nz[59];
wire dat_actv_nz59 = dat_actv_nz[59];

wire [8-1:0] wt_actv_data60 = wt_actv_data[487:480];
wire [8-1:0] dat_actv_data60 = dat_actv_data[487:480];
wire wt_actv_nz60 = wt_actv_nz[60];
wire dat_actv_nz60 = dat_actv_nz[60];

wire [8-1:0] wt_actv_data61 = wt_actv_data[495:488];
wire [8-1:0] dat_actv_data61 = dat_actv_data[495:488];
wire wt_actv_nz61 = wt_actv_nz[61];
wire dat_actv_nz61 = dat_actv_nz[61];

wire [8-1:0] wt_actv_data62 = wt_actv_data[503:496];
wire [8-1:0] dat_actv_data62 = dat_actv_data[503:496];
wire wt_actv_nz62 = wt_actv_nz[62];
wire dat_actv_nz62 = dat_actv_nz[62];

wire [8-1:0] wt_actv_data63 = wt_actv_data[511:504];
wire [8-1:0] dat_actv_data63 = dat_actv_data[511:504];
wire wt_actv_nz63 = wt_actv_nz[63];
wire dat_actv_nz63 = dat_actv_nz[63];

//| eperl: generated_end (DO NOT EDIT ABOVE)
`ifdef DESIGNWARE_NOEXIST
wire signed [22 -1:0] sum_out;
wire [64 -1:0] op_out_pvld;
//: my $mul_result_width = 18;
//: my $bpe = 8;
//: my $rwidth = 22;
//: my $result_width = $rwidth * 64 * 2;
//: for (my $i=0; $i < 64; ++$i) {
//: print "assign op_out_pvld[${i}] = wt_actv_pvld[${i}] & dat_actv_pvld[${i}] & wt_actv_nz${i} & dat_actv_nz${i};\n";
//: print "wire signed [${mul_result_width}-1:0] mout_$i = (\$signed(wt_actv_data${i}) * \$signed(dat_actv_data${i})) & \$signed({${mul_result_width}{op_out_pvld[${i}]}});\n";
//: }
//:
//: print "assign sum_out = \n";
//: for (my $i=0; $i < 64; ++$i) {
//: print "    ";
//: print "+ " if ($i != 0);
//: print "mout_$i\n";
//: }
//: print "; \n";
//| eperl: generated_beg (DO NOT EDIT BELOW)
assign op_out_pvld[0] = wt_actv_pvld[0] & dat_actv_pvld[0] & wt_actv_nz0 & dat_actv_nz0;
wire signed [18-1:0] mout_0 = ($signed(wt_actv_data0) * $signed(dat_actv_data0)) & $signed({18{op_out_pvld[0]}});
assign op_out_pvld[1] = wt_actv_pvld[1] & dat_actv_pvld[1] & wt_actv_nz1 & dat_actv_nz1;
wire signed [18-1:0] mout_1 = ($signed(wt_actv_data1) * $signed(dat_actv_data1)) & $signed({18{op_out_pvld[1]}});
assign op_out_pvld[2] = wt_actv_pvld[2] & dat_actv_pvld[2] & wt_actv_nz2 & dat_actv_nz2;
wire signed [18-1:0] mout_2 = ($signed(wt_actv_data2) * $signed(dat_actv_data2)) & $signed({18{op_out_pvld[2]}});
assign op_out_pvld[3] = wt_actv_pvld[3] & dat_actv_pvld[3] & wt_actv_nz3 & dat_actv_nz3;
wire signed [18-1:0] mout_3 = ($signed(wt_actv_data3) * $signed(dat_actv_data3)) & $signed({18{op_out_pvld[3]}});
assign op_out_pvld[4] = wt_actv_pvld[4] & dat_actv_pvld[4] & wt_actv_nz4 & dat_actv_nz4;
wire signed [18-1:0] mout_4 = ($signed(wt_actv_data4) * $signed(dat_actv_data4)) & $signed({18{op_out_pvld[4]}});
assign op_out_pvld[5] = wt_actv_pvld[5] & dat_actv_pvld[5] & wt_actv_nz5 & dat_actv_nz5;
wire signed [18-1:0] mout_5 = ($signed(wt_actv_data5) * $signed(dat_actv_data5)) & $signed({18{op_out_pvld[5]}});
assign op_out_pvld[6] = wt_actv_pvld[6] & dat_actv_pvld[6] & wt_actv_nz6 & dat_actv_nz6;
wire signed [18-1:0] mout_6 = ($signed(wt_actv_data6) * $signed(dat_actv_data6)) & $signed({18{op_out_pvld[6]}});
assign op_out_pvld[7] = wt_actv_pvld[7] & dat_actv_pvld[7] & wt_actv_nz7 & dat_actv_nz7;
wire signed [18-1:0] mout_7 = ($signed(wt_actv_data7) * $signed(dat_actv_data7)) & $signed({18{op_out_pvld[7]}});
assign op_out_pvld[8] = wt_actv_pvld[8] & dat_actv_pvld[8] & wt_actv_nz8 & dat_actv_nz8;
wire signed [18-1:0] mout_8 = ($signed(wt_actv_data8) * $signed(dat_actv_data8)) & $signed({18{op_out_pvld[8]}});
assign op_out_pvld[9] = wt_actv_pvld[9] & dat_actv_pvld[9] & wt_actv_nz9 & dat_actv_nz9;
wire signed [18-1:0] mout_9 = ($signed(wt_actv_data9) * $signed(dat_actv_data9)) & $signed({18{op_out_pvld[9]}});
assign op_out_pvld[10] = wt_actv_pvld[10] & dat_actv_pvld[10] & wt_actv_nz10 & dat_actv_nz10;
wire signed [18-1:0] mout_10 = ($signed(wt_actv_data10) * $signed(dat_actv_data10)) & $signed({18{op_out_pvld[10]}});
assign op_out_pvld[11] = wt_actv_pvld[11] & dat_actv_pvld[11] & wt_actv_nz11 & dat_actv_nz11;
wire signed [18-1:0] mout_11 = ($signed(wt_actv_data11) * $signed(dat_actv_data11)) & $signed({18{op_out_pvld[11]}});
assign op_out_pvld[12] = wt_actv_pvld[12] & dat_actv_pvld[12] & wt_actv_nz12 & dat_actv_nz12;
wire signed [18-1:0] mout_12 = ($signed(wt_actv_data12) * $signed(dat_actv_data12)) & $signed({18{op_out_pvld[12]}});
assign op_out_pvld[13] = wt_actv_pvld[13] & dat_actv_pvld[13] & wt_actv_nz13 & dat_actv_nz13;
wire signed [18-1:0] mout_13 = ($signed(wt_actv_data13) * $signed(dat_actv_data13)) & $signed({18{op_out_pvld[13]}});
assign op_out_pvld[14] = wt_actv_pvld[14] & dat_actv_pvld[14] & wt_actv_nz14 & dat_actv_nz14;
wire signed [18-1:0] mout_14 = ($signed(wt_actv_data14) * $signed(dat_actv_data14)) & $signed({18{op_out_pvld[14]}});
assign op_out_pvld[15] = wt_actv_pvld[15] & dat_actv_pvld[15] & wt_actv_nz15 & dat_actv_nz15;
wire signed [18-1:0] mout_15 = ($signed(wt_actv_data15) * $signed(dat_actv_data15)) & $signed({18{op_out_pvld[15]}});
assign op_out_pvld[16] = wt_actv_pvld[16] & dat_actv_pvld[16] & wt_actv_nz16 & dat_actv_nz16;
wire signed [18-1:0] mout_16 = ($signed(wt_actv_data16) * $signed(dat_actv_data16)) & $signed({18{op_out_pvld[16]}});
assign op_out_pvld[17] = wt_actv_pvld[17] & dat_actv_pvld[17] & wt_actv_nz17 & dat_actv_nz17;
wire signed [18-1:0] mout_17 = ($signed(wt_actv_data17) * $signed(dat_actv_data17)) & $signed({18{op_out_pvld[17]}});
assign op_out_pvld[18] = wt_actv_pvld[18] & dat_actv_pvld[18] & wt_actv_nz18 & dat_actv_nz18;
wire signed [18-1:0] mout_18 = ($signed(wt_actv_data18) * $signed(dat_actv_data18)) & $signed({18{op_out_pvld[18]}});
assign op_out_pvld[19] = wt_actv_pvld[19] & dat_actv_pvld[19] & wt_actv_nz19 & dat_actv_nz19;
wire signed [18-1:0] mout_19 = ($signed(wt_actv_data19) * $signed(dat_actv_data19)) & $signed({18{op_out_pvld[19]}});
assign op_out_pvld[20] = wt_actv_pvld[20] & dat_actv_pvld[20] & wt_actv_nz20 & dat_actv_nz20;
wire signed [18-1:0] mout_20 = ($signed(wt_actv_data20) * $signed(dat_actv_data20)) & $signed({18{op_out_pvld[20]}});
assign op_out_pvld[21] = wt_actv_pvld[21] & dat_actv_pvld[21] & wt_actv_nz21 & dat_actv_nz21;
wire signed [18-1:0] mout_21 = ($signed(wt_actv_data21) * $signed(dat_actv_data21)) & $signed({18{op_out_pvld[21]}});
assign op_out_pvld[22] = wt_actv_pvld[22] & dat_actv_pvld[22] & wt_actv_nz22 & dat_actv_nz22;
wire signed [18-1:0] mout_22 = ($signed(wt_actv_data22) * $signed(dat_actv_data22)) & $signed({18{op_out_pvld[22]}});
assign op_out_pvld[23] = wt_actv_pvld[23] & dat_actv_pvld[23] & wt_actv_nz23 & dat_actv_nz23;
wire signed [18-1:0] mout_23 = ($signed(wt_actv_data23) * $signed(dat_actv_data23)) & $signed({18{op_out_pvld[23]}});
assign op_out_pvld[24] = wt_actv_pvld[24] & dat_actv_pvld[24] & wt_actv_nz24 & dat_actv_nz24;
wire signed [18-1:0] mout_24 = ($signed(wt_actv_data24) * $signed(dat_actv_data24)) & $signed({18{op_out_pvld[24]}});
assign op_out_pvld[25] = wt_actv_pvld[25] & dat_actv_pvld[25] & wt_actv_nz25 & dat_actv_nz25;
wire signed [18-1:0] mout_25 = ($signed(wt_actv_data25) * $signed(dat_actv_data25)) & $signed({18{op_out_pvld[25]}});
assign op_out_pvld[26] = wt_actv_pvld[26] & dat_actv_pvld[26] & wt_actv_nz26 & dat_actv_nz26;
wire signed [18-1:0] mout_26 = ($signed(wt_actv_data26) * $signed(dat_actv_data26)) & $signed({18{op_out_pvld[26]}});
assign op_out_pvld[27] = wt_actv_pvld[27] & dat_actv_pvld[27] & wt_actv_nz27 & dat_actv_nz27;
wire signed [18-1:0] mout_27 = ($signed(wt_actv_data27) * $signed(dat_actv_data27)) & $signed({18{op_out_pvld[27]}});
assign op_out_pvld[28] = wt_actv_pvld[28] & dat_actv_pvld[28] & wt_actv_nz28 & dat_actv_nz28;
wire signed [18-1:0] mout_28 = ($signed(wt_actv_data28) * $signed(dat_actv_data28)) & $signed({18{op_out_pvld[28]}});
assign op_out_pvld[29] = wt_actv_pvld[29] & dat_actv_pvld[29] & wt_actv_nz29 & dat_actv_nz29;
wire signed [18-1:0] mout_29 = ($signed(wt_actv_data29) * $signed(dat_actv_data29)) & $signed({18{op_out_pvld[29]}});
assign op_out_pvld[30] = wt_actv_pvld[30] & dat_actv_pvld[30] & wt_actv_nz30 & dat_actv_nz30;
wire signed [18-1:0] mout_30 = ($signed(wt_actv_data30) * $signed(dat_actv_data30)) & $signed({18{op_out_pvld[30]}});
assign op_out_pvld[31] = wt_actv_pvld[31] & dat_actv_pvld[31] & wt_actv_nz31 & dat_actv_nz31;
wire signed [18-1:0] mout_31 = ($signed(wt_actv_data31) * $signed(dat_actv_data31)) & $signed({18{op_out_pvld[31]}});
assign op_out_pvld[32] = wt_actv_pvld[32] & dat_actv_pvld[32] & wt_actv_nz32 & dat_actv_nz32;
wire signed [18-1:0] mout_32 = ($signed(wt_actv_data32) * $signed(dat_actv_data32)) & $signed({18{op_out_pvld[32]}});
assign op_out_pvld[33] = wt_actv_pvld[33] & dat_actv_pvld[33] & wt_actv_nz33 & dat_actv_nz33;
wire signed [18-1:0] mout_33 = ($signed(wt_actv_data33) * $signed(dat_actv_data33)) & $signed({18{op_out_pvld[33]}});
assign op_out_pvld[34] = wt_actv_pvld[34] & dat_actv_pvld[34] & wt_actv_nz34 & dat_actv_nz34;
wire signed [18-1:0] mout_34 = ($signed(wt_actv_data34) * $signed(dat_actv_data34)) & $signed({18{op_out_pvld[34]}});
assign op_out_pvld[35] = wt_actv_pvld[35] & dat_actv_pvld[35] & wt_actv_nz35 & dat_actv_nz35;
wire signed [18-1:0] mout_35 = ($signed(wt_actv_data35) * $signed(dat_actv_data35)) & $signed({18{op_out_pvld[35]}});
assign op_out_pvld[36] = wt_actv_pvld[36] & dat_actv_pvld[36] & wt_actv_nz36 & dat_actv_nz36;
wire signed [18-1:0] mout_36 = ($signed(wt_actv_data36) * $signed(dat_actv_data36)) & $signed({18{op_out_pvld[36]}});
assign op_out_pvld[37] = wt_actv_pvld[37] & dat_actv_pvld[37] & wt_actv_nz37 & dat_actv_nz37;
wire signed [18-1:0] mout_37 = ($signed(wt_actv_data37) * $signed(dat_actv_data37)) & $signed({18{op_out_pvld[37]}});
assign op_out_pvld[38] = wt_actv_pvld[38] & dat_actv_pvld[38] & wt_actv_nz38 & dat_actv_nz38;
wire signed [18-1:0] mout_38 = ($signed(wt_actv_data38) * $signed(dat_actv_data38)) & $signed({18{op_out_pvld[38]}});
assign op_out_pvld[39] = wt_actv_pvld[39] & dat_actv_pvld[39] & wt_actv_nz39 & dat_actv_nz39;
wire signed [18-1:0] mout_39 = ($signed(wt_actv_data39) * $signed(dat_actv_data39)) & $signed({18{op_out_pvld[39]}});
assign op_out_pvld[40] = wt_actv_pvld[40] & dat_actv_pvld[40] & wt_actv_nz40 & dat_actv_nz40;
wire signed [18-1:0] mout_40 = ($signed(wt_actv_data40) * $signed(dat_actv_data40)) & $signed({18{op_out_pvld[40]}});
assign op_out_pvld[41] = wt_actv_pvld[41] & dat_actv_pvld[41] & wt_actv_nz41 & dat_actv_nz41;
wire signed [18-1:0] mout_41 = ($signed(wt_actv_data41) * $signed(dat_actv_data41)) & $signed({18{op_out_pvld[41]}});
assign op_out_pvld[42] = wt_actv_pvld[42] & dat_actv_pvld[42] & wt_actv_nz42 & dat_actv_nz42;
wire signed [18-1:0] mout_42 = ($signed(wt_actv_data42) * $signed(dat_actv_data42)) & $signed({18{op_out_pvld[42]}});
assign op_out_pvld[43] = wt_actv_pvld[43] & dat_actv_pvld[43] & wt_actv_nz43 & dat_actv_nz43;
wire signed [18-1:0] mout_43 = ($signed(wt_actv_data43) * $signed(dat_actv_data43)) & $signed({18{op_out_pvld[43]}});
assign op_out_pvld[44] = wt_actv_pvld[44] & dat_actv_pvld[44] & wt_actv_nz44 & dat_actv_nz44;
wire signed [18-1:0] mout_44 = ($signed(wt_actv_data44) * $signed(dat_actv_data44)) & $signed({18{op_out_pvld[44]}});
assign op_out_pvld[45] = wt_actv_pvld[45] & dat_actv_pvld[45] & wt_actv_nz45 & dat_actv_nz45;
wire signed [18-1:0] mout_45 = ($signed(wt_actv_data45) * $signed(dat_actv_data45)) & $signed({18{op_out_pvld[45]}});
assign op_out_pvld[46] = wt_actv_pvld[46] & dat_actv_pvld[46] & wt_actv_nz46 & dat_actv_nz46;
wire signed [18-1:0] mout_46 = ($signed(wt_actv_data46) * $signed(dat_actv_data46)) & $signed({18{op_out_pvld[46]}});
assign op_out_pvld[47] = wt_actv_pvld[47] & dat_actv_pvld[47] & wt_actv_nz47 & dat_actv_nz47;
wire signed [18-1:0] mout_47 = ($signed(wt_actv_data47) * $signed(dat_actv_data47)) & $signed({18{op_out_pvld[47]}});
assign op_out_pvld[48] = wt_actv_pvld[48] & dat_actv_pvld[48] & wt_actv_nz48 & dat_actv_nz48;
wire signed [18-1:0] mout_48 = ($signed(wt_actv_data48) * $signed(dat_actv_data48)) & $signed({18{op_out_pvld[48]}});
assign op_out_pvld[49] = wt_actv_pvld[49] & dat_actv_pvld[49] & wt_actv_nz49 & dat_actv_nz49;
wire signed [18-1:0] mout_49 = ($signed(wt_actv_data49) * $signed(dat_actv_data49)) & $signed({18{op_out_pvld[49]}});
assign op_out_pvld[50] = wt_actv_pvld[50] & dat_actv_pvld[50] & wt_actv_nz50 & dat_actv_nz50;
wire signed [18-1:0] mout_50 = ($signed(wt_actv_data50) * $signed(dat_actv_data50)) & $signed({18{op_out_pvld[50]}});
assign op_out_pvld[51] = wt_actv_pvld[51] & dat_actv_pvld[51] & wt_actv_nz51 & dat_actv_nz51;
wire signed [18-1:0] mout_51 = ($signed(wt_actv_data51) * $signed(dat_actv_data51)) & $signed({18{op_out_pvld[51]}});
assign op_out_pvld[52] = wt_actv_pvld[52] & dat_actv_pvld[52] & wt_actv_nz52 & dat_actv_nz52;
wire signed [18-1:0] mout_52 = ($signed(wt_actv_data52) * $signed(dat_actv_data52)) & $signed({18{op_out_pvld[52]}});
assign op_out_pvld[53] = wt_actv_pvld[53] & dat_actv_pvld[53] & wt_actv_nz53 & dat_actv_nz53;
wire signed [18-1:0] mout_53 = ($signed(wt_actv_data53) * $signed(dat_actv_data53)) & $signed({18{op_out_pvld[53]}});
assign op_out_pvld[54] = wt_actv_pvld[54] & dat_actv_pvld[54] & wt_actv_nz54 & dat_actv_nz54;
wire signed [18-1:0] mout_54 = ($signed(wt_actv_data54) * $signed(dat_actv_data54)) & $signed({18{op_out_pvld[54]}});
assign op_out_pvld[55] = wt_actv_pvld[55] & dat_actv_pvld[55] & wt_actv_nz55 & dat_actv_nz55;
wire signed [18-1:0] mout_55 = ($signed(wt_actv_data55) * $signed(dat_actv_data55)) & $signed({18{op_out_pvld[55]}});
assign op_out_pvld[56] = wt_actv_pvld[56] & dat_actv_pvld[56] & wt_actv_nz56 & dat_actv_nz56;
wire signed [18-1:0] mout_56 = ($signed(wt_actv_data56) * $signed(dat_actv_data56)) & $signed({18{op_out_pvld[56]}});
assign op_out_pvld[57] = wt_actv_pvld[57] & dat_actv_pvld[57] & wt_actv_nz57 & dat_actv_nz57;
wire signed [18-1:0] mout_57 = ($signed(wt_actv_data57) * $signed(dat_actv_data57)) & $signed({18{op_out_pvld[57]}});
assign op_out_pvld[58] = wt_actv_pvld[58] & dat_actv_pvld[58] & wt_actv_nz58 & dat_actv_nz58;
wire signed [18-1:0] mout_58 = ($signed(wt_actv_data58) * $signed(dat_actv_data58)) & $signed({18{op_out_pvld[58]}});
assign op_out_pvld[59] = wt_actv_pvld[59] & dat_actv_pvld[59] & wt_actv_nz59 & dat_actv_nz59;
wire signed [18-1:0] mout_59 = ($signed(wt_actv_data59) * $signed(dat_actv_data59)) & $signed({18{op_out_pvld[59]}});
assign op_out_pvld[60] = wt_actv_pvld[60] & dat_actv_pvld[60] & wt_actv_nz60 & dat_actv_nz60;
wire signed [18-1:0] mout_60 = ($signed(wt_actv_data60) * $signed(dat_actv_data60)) & $signed({18{op_out_pvld[60]}});
assign op_out_pvld[61] = wt_actv_pvld[61] & dat_actv_pvld[61] & wt_actv_nz61 & dat_actv_nz61;
wire signed [18-1:0] mout_61 = ($signed(wt_actv_data61) * $signed(dat_actv_data61)) & $signed({18{op_out_pvld[61]}});
assign op_out_pvld[62] = wt_actv_pvld[62] & dat_actv_pvld[62] & wt_actv_nz62 & dat_actv_nz62;
wire signed [18-1:0] mout_62 = ($signed(wt_actv_data62) * $signed(dat_actv_data62)) & $signed({18{op_out_pvld[62]}});
assign op_out_pvld[63] = wt_actv_pvld[63] & dat_actv_pvld[63] & wt_actv_nz63 & dat_actv_nz63;
wire signed [18-1:0] mout_63 = ($signed(wt_actv_data63) * $signed(dat_actv_data63)) & $signed({18{op_out_pvld[63]}});
assign sum_out = 
    mout_0
    + mout_1
    + mout_2
    + mout_3
    + mout_4
    + mout_5
    + mout_6
    + mout_7
    + mout_8
    + mout_9
    + mout_10
    + mout_11
    + mout_12
    + mout_13
    + mout_14
    + mout_15
    + mout_16
    + mout_17
    + mout_18
    + mout_19
    + mout_20
    + mout_21
    + mout_22
    + mout_23
    + mout_24
    + mout_25
    + mout_26
    + mout_27
    + mout_28
    + mout_29
    + mout_30
    + mout_31
    + mout_32
    + mout_33
    + mout_34
    + mout_35
    + mout_36
    + mout_37
    + mout_38
    + mout_39
    + mout_40
    + mout_41
    + mout_42
    + mout_43
    + mout_44
    + mout_45
    + mout_46
    + mout_47
    + mout_48
    + mout_49
    + mout_50
    + mout_51
    + mout_52
    + mout_53
    + mout_54
    + mout_55
    + mout_56
    + mout_57
    + mout_58
    + mout_59
    + mout_60
    + mout_61
    + mout_62
    + mout_63
; 

//| eperl: generated_end (DO NOT EDIT ABOVE)
`endif
`ifndef DESIGNWARE_NOEXIST
wire [22 -1:0] sum_out;
wire [22*64*2-1:0] full_mul_result;
wire [64 -1:0] op_out_pvld;
//: my $mul_result_width = 18;
//: my $bpe = 8;
//: my $rwidth = 22;
//: for (my $i=0; $i < 64; ++$i) {
//: my $j = $i * 2;
//: my $k = $i * 2 + 1;
//: print qq(
//: wire [$mul_result_width-1:0] mout_$j;
//: wire [$mul_result_width-1:0] mout_$k;
//: DW02_multp #(${bpe}, ${bpe}, $mul_result_width) mul$i (
//: .a(wt_actv_data${i}),
//: .b(dat_actv_data${i}),
//: .tc(1'b1),
//: .out0(mout_${j}),
//: .out1(mout_${k})
//: );
//: assign op_out_pvld[${i}] = wt_actv_pvld[${i}] & dat_actv_pvld[${i}] & wt_actv_nz${i} & dat_actv_nz${i};
//: );
//:
//: my $offset = $j * $rwidth;
//: my $sign_extend_bits = 22 - $mul_result_width;
//: print qq(
//: assign full_mul_result[$offset + $rwidth - 1 : $offset] = {{${sign_extend_bits}{mout_${j}[${mul_result_width}-1]}}, mout_$j} & {${rwidth}{op_out_pvld[$i]}}; );
//: $offset = $k * $rwidth;
//: print qq(
//: assign full_mul_result[$offset + $rwidth - 1 : $offset] = {{${sign_extend_bits}{mout_${k}[${mul_result_width}-1]}}, mout_$k} & {${rwidth}{op_out_pvld[$i]}}; );
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)

wire [18-1:0] mout_0;
wire [18-1:0] mout_1;
DW02_multp #(8, 8, 18) mul0 (
.a(wt_actv_data0),
.b(dat_actv_data0),
.tc(1'b1),
.out0(mout_0),
.out1(mout_1)
);
assign op_out_pvld[0] = wt_actv_pvld[0] & dat_actv_pvld[0] & wt_actv_nz0 & dat_actv_nz0;

assign full_mul_result[0 + 22 - 1 : 0] = {{4{mout_0[18-1]}}, mout_0} & {22{op_out_pvld[0]}}; 
assign full_mul_result[22 + 22 - 1 : 22] = {{4{mout_1[18-1]}}, mout_1} & {22{op_out_pvld[0]}}; 
wire [18-1:0] mout_2;
wire [18-1:0] mout_3;
DW02_multp #(8, 8, 18) mul1 (
.a(wt_actv_data1),
.b(dat_actv_data1),
.tc(1'b1),
.out0(mout_2),
.out1(mout_3)
);
assign op_out_pvld[1] = wt_actv_pvld[1] & dat_actv_pvld[1] & wt_actv_nz1 & dat_actv_nz1;

assign full_mul_result[44 + 22 - 1 : 44] = {{4{mout_2[18-1]}}, mout_2} & {22{op_out_pvld[1]}}; 
assign full_mul_result[66 + 22 - 1 : 66] = {{4{mout_3[18-1]}}, mout_3} & {22{op_out_pvld[1]}}; 
wire [18-1:0] mout_4;
wire [18-1:0] mout_5;
DW02_multp #(8, 8, 18) mul2 (
.a(wt_actv_data2),
.b(dat_actv_data2),
.tc(1'b1),
.out0(mout_4),
.out1(mout_5)
);
assign op_out_pvld[2] = wt_actv_pvld[2] & dat_actv_pvld[2] & wt_actv_nz2 & dat_actv_nz2;

assign full_mul_result[88 + 22 - 1 : 88] = {{4{mout_4[18-1]}}, mout_4} & {22{op_out_pvld[2]}}; 
assign full_mul_result[110 + 22 - 1 : 110] = {{4{mout_5[18-1]}}, mout_5} & {22{op_out_pvld[2]}}; 
wire [18-1:0] mout_6;
wire [18-1:0] mout_7;
DW02_multp #(8, 8, 18) mul3 (
.a(wt_actv_data3),
.b(dat_actv_data3),
.tc(1'b1),
.out0(mout_6),
.out1(mout_7)
);
assign op_out_pvld[3] = wt_actv_pvld[3] & dat_actv_pvld[3] & wt_actv_nz3 & dat_actv_nz3;

assign full_mul_result[132 + 22 - 1 : 132] = {{4{mout_6[18-1]}}, mout_6} & {22{op_out_pvld[3]}}; 
assign full_mul_result[154 + 22 - 1 : 154] = {{4{mout_7[18-1]}}, mout_7} & {22{op_out_pvld[3]}}; 
wire [18-1:0] mout_8;
wire [18-1:0] mout_9;
DW02_multp #(8, 8, 18) mul4 (
.a(wt_actv_data4),
.b(dat_actv_data4),
.tc(1'b1),
.out0(mout_8),
.out1(mout_9)
);
assign op_out_pvld[4] = wt_actv_pvld[4] & dat_actv_pvld[4] & wt_actv_nz4 & dat_actv_nz4;

assign full_mul_result[176 + 22 - 1 : 176] = {{4{mout_8[18-1]}}, mout_8} & {22{op_out_pvld[4]}}; 
assign full_mul_result[198 + 22 - 1 : 198] = {{4{mout_9[18-1]}}, mout_9} & {22{op_out_pvld[4]}}; 
wire [18-1:0] mout_10;
wire [18-1:0] mout_11;
DW02_multp #(8, 8, 18) mul5 (
.a(wt_actv_data5),
.b(dat_actv_data5),
.tc(1'b1),
.out0(mout_10),
.out1(mout_11)
);
assign op_out_pvld[5] = wt_actv_pvld[5] & dat_actv_pvld[5] & wt_actv_nz5 & dat_actv_nz5;

assign full_mul_result[220 + 22 - 1 : 220] = {{4{mout_10[18-1]}}, mout_10} & {22{op_out_pvld[5]}}; 
assign full_mul_result[242 + 22 - 1 : 242] = {{4{mout_11[18-1]}}, mout_11} & {22{op_out_pvld[5]}}; 
wire [18-1:0] mout_12;
wire [18-1:0] mout_13;
DW02_multp #(8, 8, 18) mul6 (
.a(wt_actv_data6),
.b(dat_actv_data6),
.tc(1'b1),
.out0(mout_12),
.out1(mout_13)
);
assign op_out_pvld[6] = wt_actv_pvld[6] & dat_actv_pvld[6] & wt_actv_nz6 & dat_actv_nz6;

assign full_mul_result[264 + 22 - 1 : 264] = {{4{mout_12[18-1]}}, mout_12} & {22{op_out_pvld[6]}}; 
assign full_mul_result[286 + 22 - 1 : 286] = {{4{mout_13[18-1]}}, mout_13} & {22{op_out_pvld[6]}}; 
wire [18-1:0] mout_14;
wire [18-1:0] mout_15;
DW02_multp #(8, 8, 18) mul7 (
.a(wt_actv_data7),
.b(dat_actv_data7),
.tc(1'b1),
.out0(mout_14),
.out1(mout_15)
);
assign op_out_pvld[7] = wt_actv_pvld[7] & dat_actv_pvld[7] & wt_actv_nz7 & dat_actv_nz7;

assign full_mul_result[308 + 22 - 1 : 308] = {{4{mout_14[18-1]}}, mout_14} & {22{op_out_pvld[7]}}; 
assign full_mul_result[330 + 22 - 1 : 330] = {{4{mout_15[18-1]}}, mout_15} & {22{op_out_pvld[7]}}; 
wire [18-1:0] mout_16;
wire [18-1:0] mout_17;
DW02_multp #(8, 8, 18) mul8 (
.a(wt_actv_data8),
.b(dat_actv_data8),
.tc(1'b1),
.out0(mout_16),
.out1(mout_17)
);
assign op_out_pvld[8] = wt_actv_pvld[8] & dat_actv_pvld[8] & wt_actv_nz8 & dat_actv_nz8;

assign full_mul_result[352 + 22 - 1 : 352] = {{4{mout_16[18-1]}}, mout_16} & {22{op_out_pvld[8]}}; 
assign full_mul_result[374 + 22 - 1 : 374] = {{4{mout_17[18-1]}}, mout_17} & {22{op_out_pvld[8]}}; 
wire [18-1:0] mout_18;
wire [18-1:0] mout_19;
DW02_multp #(8, 8, 18) mul9 (
.a(wt_actv_data9),
.b(dat_actv_data9),
.tc(1'b1),
.out0(mout_18),
.out1(mout_19)
);
assign op_out_pvld[9] = wt_actv_pvld[9] & dat_actv_pvld[9] & wt_actv_nz9 & dat_actv_nz9;

assign full_mul_result[396 + 22 - 1 : 396] = {{4{mout_18[18-1]}}, mout_18} & {22{op_out_pvld[9]}}; 
assign full_mul_result[418 + 22 - 1 : 418] = {{4{mout_19[18-1]}}, mout_19} & {22{op_out_pvld[9]}}; 
wire [18-1:0] mout_20;
wire [18-1:0] mout_21;
DW02_multp #(8, 8, 18) mul10 (
.a(wt_actv_data10),
.b(dat_actv_data10),
.tc(1'b1),
.out0(mout_20),
.out1(mout_21)
);
assign op_out_pvld[10] = wt_actv_pvld[10] & dat_actv_pvld[10] & wt_actv_nz10 & dat_actv_nz10;

assign full_mul_result[440 + 22 - 1 : 440] = {{4{mout_20[18-1]}}, mout_20} & {22{op_out_pvld[10]}}; 
assign full_mul_result[462 + 22 - 1 : 462] = {{4{mout_21[18-1]}}, mout_21} & {22{op_out_pvld[10]}}; 
wire [18-1:0] mout_22;
wire [18-1:0] mout_23;
DW02_multp #(8, 8, 18) mul11 (
.a(wt_actv_data11),
.b(dat_actv_data11),
.tc(1'b1),
.out0(mout_22),
.out1(mout_23)
);
assign op_out_pvld[11] = wt_actv_pvld[11] & dat_actv_pvld[11] & wt_actv_nz11 & dat_actv_nz11;

assign full_mul_result[484 + 22 - 1 : 484] = {{4{mout_22[18-1]}}, mout_22} & {22{op_out_pvld[11]}}; 
assign full_mul_result[506 + 22 - 1 : 506] = {{4{mout_23[18-1]}}, mout_23} & {22{op_out_pvld[11]}}; 
wire [18-1:0] mout_24;
wire [18-1:0] mout_25;
DW02_multp #(8, 8, 18) mul12 (
.a(wt_actv_data12),
.b(dat_actv_data12),
.tc(1'b1),
.out0(mout_24),
.out1(mout_25)
);
assign op_out_pvld[12] = wt_actv_pvld[12] & dat_actv_pvld[12] & wt_actv_nz12 & dat_actv_nz12;

assign full_mul_result[528 + 22 - 1 : 528] = {{4{mout_24[18-1]}}, mout_24} & {22{op_out_pvld[12]}}; 
assign full_mul_result[550 + 22 - 1 : 550] = {{4{mout_25[18-1]}}, mout_25} & {22{op_out_pvld[12]}}; 
wire [18-1:0] mout_26;
wire [18-1:0] mout_27;
DW02_multp #(8, 8, 18) mul13 (
.a(wt_actv_data13),
.b(dat_actv_data13),
.tc(1'b1),
.out0(mout_26),
.out1(mout_27)
);
assign op_out_pvld[13] = wt_actv_pvld[13] & dat_actv_pvld[13] & wt_actv_nz13 & dat_actv_nz13;

assign full_mul_result[572 + 22 - 1 : 572] = {{4{mout_26[18-1]}}, mout_26} & {22{op_out_pvld[13]}}; 
assign full_mul_result[594 + 22 - 1 : 594] = {{4{mout_27[18-1]}}, mout_27} & {22{op_out_pvld[13]}}; 
wire [18-1:0] mout_28;
wire [18-1:0] mout_29;
DW02_multp #(8, 8, 18) mul14 (
.a(wt_actv_data14),
.b(dat_actv_data14),
.tc(1'b1),
.out0(mout_28),
.out1(mout_29)
);
assign op_out_pvld[14] = wt_actv_pvld[14] & dat_actv_pvld[14] & wt_actv_nz14 & dat_actv_nz14;

assign full_mul_result[616 + 22 - 1 : 616] = {{4{mout_28[18-1]}}, mout_28} & {22{op_out_pvld[14]}}; 
assign full_mul_result[638 + 22 - 1 : 638] = {{4{mout_29[18-1]}}, mout_29} & {22{op_out_pvld[14]}}; 
wire [18-1:0] mout_30;
wire [18-1:0] mout_31;
DW02_multp #(8, 8, 18) mul15 (
.a(wt_actv_data15),
.b(dat_actv_data15),
.tc(1'b1),
.out0(mout_30),
.out1(mout_31)
);
assign op_out_pvld[15] = wt_actv_pvld[15] & dat_actv_pvld[15] & wt_actv_nz15 & dat_actv_nz15;

assign full_mul_result[660 + 22 - 1 : 660] = {{4{mout_30[18-1]}}, mout_30} & {22{op_out_pvld[15]}}; 
assign full_mul_result[682 + 22 - 1 : 682] = {{4{mout_31[18-1]}}, mout_31} & {22{op_out_pvld[15]}}; 
wire [18-1:0] mout_32;
wire [18-1:0] mout_33;
DW02_multp #(8, 8, 18) mul16 (
.a(wt_actv_data16),
.b(dat_actv_data16),
.tc(1'b1),
.out0(mout_32),
.out1(mout_33)
);
assign op_out_pvld[16] = wt_actv_pvld[16] & dat_actv_pvld[16] & wt_actv_nz16 & dat_actv_nz16;

assign full_mul_result[704 + 22 - 1 : 704] = {{4{mout_32[18-1]}}, mout_32} & {22{op_out_pvld[16]}}; 
assign full_mul_result[726 + 22 - 1 : 726] = {{4{mout_33[18-1]}}, mout_33} & {22{op_out_pvld[16]}}; 
wire [18-1:0] mout_34;
wire [18-1:0] mout_35;
DW02_multp #(8, 8, 18) mul17 (
.a(wt_actv_data17),
.b(dat_actv_data17),
.tc(1'b1),
.out0(mout_34),
.out1(mout_35)
);
assign op_out_pvld[17] = wt_actv_pvld[17] & dat_actv_pvld[17] & wt_actv_nz17 & dat_actv_nz17;

assign full_mul_result[748 + 22 - 1 : 748] = {{4{mout_34[18-1]}}, mout_34} & {22{op_out_pvld[17]}}; 
assign full_mul_result[770 + 22 - 1 : 770] = {{4{mout_35[18-1]}}, mout_35} & {22{op_out_pvld[17]}}; 
wire [18-1:0] mout_36;
wire [18-1:0] mout_37;
DW02_multp #(8, 8, 18) mul18 (
.a(wt_actv_data18),
.b(dat_actv_data18),
.tc(1'b1),
.out0(mout_36),
.out1(mout_37)
);
assign op_out_pvld[18] = wt_actv_pvld[18] & dat_actv_pvld[18] & wt_actv_nz18 & dat_actv_nz18;

assign full_mul_result[792 + 22 - 1 : 792] = {{4{mout_36[18-1]}}, mout_36} & {22{op_out_pvld[18]}}; 
assign full_mul_result[814 + 22 - 1 : 814] = {{4{mout_37[18-1]}}, mout_37} & {22{op_out_pvld[18]}}; 
wire [18-1:0] mout_38;
wire [18-1:0] mout_39;
DW02_multp #(8, 8, 18) mul19 (
.a(wt_actv_data19),
.b(dat_actv_data19),
.tc(1'b1),
.out0(mout_38),
.out1(mout_39)
);
assign op_out_pvld[19] = wt_actv_pvld[19] & dat_actv_pvld[19] & wt_actv_nz19 & dat_actv_nz19;

assign full_mul_result[836 + 22 - 1 : 836] = {{4{mout_38[18-1]}}, mout_38} & {22{op_out_pvld[19]}}; 
assign full_mul_result[858 + 22 - 1 : 858] = {{4{mout_39[18-1]}}, mout_39} & {22{op_out_pvld[19]}}; 
wire [18-1:0] mout_40;
wire [18-1:0] mout_41;
DW02_multp #(8, 8, 18) mul20 (
.a(wt_actv_data20),
.b(dat_actv_data20),
.tc(1'b1),
.out0(mout_40),
.out1(mout_41)
);
assign op_out_pvld[20] = wt_actv_pvld[20] & dat_actv_pvld[20] & wt_actv_nz20 & dat_actv_nz20;

assign full_mul_result[880 + 22 - 1 : 880] = {{4{mout_40[18-1]}}, mout_40} & {22{op_out_pvld[20]}}; 
assign full_mul_result[902 + 22 - 1 : 902] = {{4{mout_41[18-1]}}, mout_41} & {22{op_out_pvld[20]}}; 
wire [18-1:0] mout_42;
wire [18-1:0] mout_43;
DW02_multp #(8, 8, 18) mul21 (
.a(wt_actv_data21),
.b(dat_actv_data21),
.tc(1'b1),
.out0(mout_42),
.out1(mout_43)
);
assign op_out_pvld[21] = wt_actv_pvld[21] & dat_actv_pvld[21] & wt_actv_nz21 & dat_actv_nz21;

assign full_mul_result[924 + 22 - 1 : 924] = {{4{mout_42[18-1]}}, mout_42} & {22{op_out_pvld[21]}}; 
assign full_mul_result[946 + 22 - 1 : 946] = {{4{mout_43[18-1]}}, mout_43} & {22{op_out_pvld[21]}}; 
wire [18-1:0] mout_44;
wire [18-1:0] mout_45;
DW02_multp #(8, 8, 18) mul22 (
.a(wt_actv_data22),
.b(dat_actv_data22),
.tc(1'b1),
.out0(mout_44),
.out1(mout_45)
);
assign op_out_pvld[22] = wt_actv_pvld[22] & dat_actv_pvld[22] & wt_actv_nz22 & dat_actv_nz22;

assign full_mul_result[968 + 22 - 1 : 968] = {{4{mout_44[18-1]}}, mout_44} & {22{op_out_pvld[22]}}; 
assign full_mul_result[990 + 22 - 1 : 990] = {{4{mout_45[18-1]}}, mout_45} & {22{op_out_pvld[22]}}; 
wire [18-1:0] mout_46;
wire [18-1:0] mout_47;
DW02_multp #(8, 8, 18) mul23 (
.a(wt_actv_data23),
.b(dat_actv_data23),
.tc(1'b1),
.out0(mout_46),
.out1(mout_47)
);
assign op_out_pvld[23] = wt_actv_pvld[23] & dat_actv_pvld[23] & wt_actv_nz23 & dat_actv_nz23;

assign full_mul_result[1012 + 22 - 1 : 1012] = {{4{mout_46[18-1]}}, mout_46} & {22{op_out_pvld[23]}}; 
assign full_mul_result[1034 + 22 - 1 : 1034] = {{4{mout_47[18-1]}}, mout_47} & {22{op_out_pvld[23]}}; 
wire [18-1:0] mout_48;
wire [18-1:0] mout_49;
DW02_multp #(8, 8, 18) mul24 (
.a(wt_actv_data24),
.b(dat_actv_data24),
.tc(1'b1),
.out0(mout_48),
.out1(mout_49)
);
assign op_out_pvld[24] = wt_actv_pvld[24] & dat_actv_pvld[24] & wt_actv_nz24 & dat_actv_nz24;

assign full_mul_result[1056 + 22 - 1 : 1056] = {{4{mout_48[18-1]}}, mout_48} & {22{op_out_pvld[24]}}; 
assign full_mul_result[1078 + 22 - 1 : 1078] = {{4{mout_49[18-1]}}, mout_49} & {22{op_out_pvld[24]}}; 
wire [18-1:0] mout_50;
wire [18-1:0] mout_51;
DW02_multp #(8, 8, 18) mul25 (
.a(wt_actv_data25),
.b(dat_actv_data25),
.tc(1'b1),
.out0(mout_50),
.out1(mout_51)
);
assign op_out_pvld[25] = wt_actv_pvld[25] & dat_actv_pvld[25] & wt_actv_nz25 & dat_actv_nz25;

assign full_mul_result[1100 + 22 - 1 : 1100] = {{4{mout_50[18-1]}}, mout_50} & {22{op_out_pvld[25]}}; 
assign full_mul_result[1122 + 22 - 1 : 1122] = {{4{mout_51[18-1]}}, mout_51} & {22{op_out_pvld[25]}}; 
wire [18-1:0] mout_52;
wire [18-1:0] mout_53;
DW02_multp #(8, 8, 18) mul26 (
.a(wt_actv_data26),
.b(dat_actv_data26),
.tc(1'b1),
.out0(mout_52),
.out1(mout_53)
);
assign op_out_pvld[26] = wt_actv_pvld[26] & dat_actv_pvld[26] & wt_actv_nz26 & dat_actv_nz26;

assign full_mul_result[1144 + 22 - 1 : 1144] = {{4{mout_52[18-1]}}, mout_52} & {22{op_out_pvld[26]}}; 
assign full_mul_result[1166 + 22 - 1 : 1166] = {{4{mout_53[18-1]}}, mout_53} & {22{op_out_pvld[26]}}; 
wire [18-1:0] mout_54;
wire [18-1:0] mout_55;
DW02_multp #(8, 8, 18) mul27 (
.a(wt_actv_data27),
.b(dat_actv_data27),
.tc(1'b1),
.out0(mout_54),
.out1(mout_55)
);
assign op_out_pvld[27] = wt_actv_pvld[27] & dat_actv_pvld[27] & wt_actv_nz27 & dat_actv_nz27;

assign full_mul_result[1188 + 22 - 1 : 1188] = {{4{mout_54[18-1]}}, mout_54} & {22{op_out_pvld[27]}}; 
assign full_mul_result[1210 + 22 - 1 : 1210] = {{4{mout_55[18-1]}}, mout_55} & {22{op_out_pvld[27]}}; 
wire [18-1:0] mout_56;
wire [18-1:0] mout_57;
DW02_multp #(8, 8, 18) mul28 (
.a(wt_actv_data28),
.b(dat_actv_data28),
.tc(1'b1),
.out0(mout_56),
.out1(mout_57)
);
assign op_out_pvld[28] = wt_actv_pvld[28] & dat_actv_pvld[28] & wt_actv_nz28 & dat_actv_nz28;

assign full_mul_result[1232 + 22 - 1 : 1232] = {{4{mout_56[18-1]}}, mout_56} & {22{op_out_pvld[28]}}; 
assign full_mul_result[1254 + 22 - 1 : 1254] = {{4{mout_57[18-1]}}, mout_57} & {22{op_out_pvld[28]}}; 
wire [18-1:0] mout_58;
wire [18-1:0] mout_59;
DW02_multp #(8, 8, 18) mul29 (
.a(wt_actv_data29),
.b(dat_actv_data29),
.tc(1'b1),
.out0(mout_58),
.out1(mout_59)
);
assign op_out_pvld[29] = wt_actv_pvld[29] & dat_actv_pvld[29] & wt_actv_nz29 & dat_actv_nz29;

assign full_mul_result[1276 + 22 - 1 : 1276] = {{4{mout_58[18-1]}}, mout_58} & {22{op_out_pvld[29]}}; 
assign full_mul_result[1298 + 22 - 1 : 1298] = {{4{mout_59[18-1]}}, mout_59} & {22{op_out_pvld[29]}}; 
wire [18-1:0] mout_60;
wire [18-1:0] mout_61;
DW02_multp #(8, 8, 18) mul30 (
.a(wt_actv_data30),
.b(dat_actv_data30),
.tc(1'b1),
.out0(mout_60),
.out1(mout_61)
);
assign op_out_pvld[30] = wt_actv_pvld[30] & dat_actv_pvld[30] & wt_actv_nz30 & dat_actv_nz30;

assign full_mul_result[1320 + 22 - 1 : 1320] = {{4{mout_60[18-1]}}, mout_60} & {22{op_out_pvld[30]}}; 
assign full_mul_result[1342 + 22 - 1 : 1342] = {{4{mout_61[18-1]}}, mout_61} & {22{op_out_pvld[30]}}; 
wire [18-1:0] mout_62;
wire [18-1:0] mout_63;
DW02_multp #(8, 8, 18) mul31 (
.a(wt_actv_data31),
.b(dat_actv_data31),
.tc(1'b1),
.out0(mout_62),
.out1(mout_63)
);
assign op_out_pvld[31] = wt_actv_pvld[31] & dat_actv_pvld[31] & wt_actv_nz31 & dat_actv_nz31;

assign full_mul_result[1364 + 22 - 1 : 1364] = {{4{mout_62[18-1]}}, mout_62} & {22{op_out_pvld[31]}}; 
assign full_mul_result[1386 + 22 - 1 : 1386] = {{4{mout_63[18-1]}}, mout_63} & {22{op_out_pvld[31]}}; 
wire [18-1:0] mout_64;
wire [18-1:0] mout_65;
DW02_multp #(8, 8, 18) mul32 (
.a(wt_actv_data32),
.b(dat_actv_data32),
.tc(1'b1),
.out0(mout_64),
.out1(mout_65)
);
assign op_out_pvld[32] = wt_actv_pvld[32] & dat_actv_pvld[32] & wt_actv_nz32 & dat_actv_nz32;

assign full_mul_result[1408 + 22 - 1 : 1408] = {{4{mout_64[18-1]}}, mout_64} & {22{op_out_pvld[32]}}; 
assign full_mul_result[1430 + 22 - 1 : 1430] = {{4{mout_65[18-1]}}, mout_65} & {22{op_out_pvld[32]}}; 
wire [18-1:0] mout_66;
wire [18-1:0] mout_67;
DW02_multp #(8, 8, 18) mul33 (
.a(wt_actv_data33),
.b(dat_actv_data33),
.tc(1'b1),
.out0(mout_66),
.out1(mout_67)
);
assign op_out_pvld[33] = wt_actv_pvld[33] & dat_actv_pvld[33] & wt_actv_nz33 & dat_actv_nz33;

assign full_mul_result[1452 + 22 - 1 : 1452] = {{4{mout_66[18-1]}}, mout_66} & {22{op_out_pvld[33]}}; 
assign full_mul_result[1474 + 22 - 1 : 1474] = {{4{mout_67[18-1]}}, mout_67} & {22{op_out_pvld[33]}}; 
wire [18-1:0] mout_68;
wire [18-1:0] mout_69;
DW02_multp #(8, 8, 18) mul34 (
.a(wt_actv_data34),
.b(dat_actv_data34),
.tc(1'b1),
.out0(mout_68),
.out1(mout_69)
);
assign op_out_pvld[34] = wt_actv_pvld[34] & dat_actv_pvld[34] & wt_actv_nz34 & dat_actv_nz34;

assign full_mul_result[1496 + 22 - 1 : 1496] = {{4{mout_68[18-1]}}, mout_68} & {22{op_out_pvld[34]}}; 
assign full_mul_result[1518 + 22 - 1 : 1518] = {{4{mout_69[18-1]}}, mout_69} & {22{op_out_pvld[34]}}; 
wire [18-1:0] mout_70;
wire [18-1:0] mout_71;
DW02_multp #(8, 8, 18) mul35 (
.a(wt_actv_data35),
.b(dat_actv_data35),
.tc(1'b1),
.out0(mout_70),
.out1(mout_71)
);
assign op_out_pvld[35] = wt_actv_pvld[35] & dat_actv_pvld[35] & wt_actv_nz35 & dat_actv_nz35;

assign full_mul_result[1540 + 22 - 1 : 1540] = {{4{mout_70[18-1]}}, mout_70} & {22{op_out_pvld[35]}}; 
assign full_mul_result[1562 + 22 - 1 : 1562] = {{4{mout_71[18-1]}}, mout_71} & {22{op_out_pvld[35]}}; 
wire [18-1:0] mout_72;
wire [18-1:0] mout_73;
DW02_multp #(8, 8, 18) mul36 (
.a(wt_actv_data36),
.b(dat_actv_data36),
.tc(1'b1),
.out0(mout_72),
.out1(mout_73)
);
assign op_out_pvld[36] = wt_actv_pvld[36] & dat_actv_pvld[36] & wt_actv_nz36 & dat_actv_nz36;

assign full_mul_result[1584 + 22 - 1 : 1584] = {{4{mout_72[18-1]}}, mout_72} & {22{op_out_pvld[36]}}; 
assign full_mul_result[1606 + 22 - 1 : 1606] = {{4{mout_73[18-1]}}, mout_73} & {22{op_out_pvld[36]}}; 
wire [18-1:0] mout_74;
wire [18-1:0] mout_75;
DW02_multp #(8, 8, 18) mul37 (
.a(wt_actv_data37),
.b(dat_actv_data37),
.tc(1'b1),
.out0(mout_74),
.out1(mout_75)
);
assign op_out_pvld[37] = wt_actv_pvld[37] & dat_actv_pvld[37] & wt_actv_nz37 & dat_actv_nz37;

assign full_mul_result[1628 + 22 - 1 : 1628] = {{4{mout_74[18-1]}}, mout_74} & {22{op_out_pvld[37]}}; 
assign full_mul_result[1650 + 22 - 1 : 1650] = {{4{mout_75[18-1]}}, mout_75} & {22{op_out_pvld[37]}}; 
wire [18-1:0] mout_76;
wire [18-1:0] mout_77;
DW02_multp #(8, 8, 18) mul38 (
.a(wt_actv_data38),
.b(dat_actv_data38),
.tc(1'b1),
.out0(mout_76),
.out1(mout_77)
);
assign op_out_pvld[38] = wt_actv_pvld[38] & dat_actv_pvld[38] & wt_actv_nz38 & dat_actv_nz38;

assign full_mul_result[1672 + 22 - 1 : 1672] = {{4{mout_76[18-1]}}, mout_76} & {22{op_out_pvld[38]}}; 
assign full_mul_result[1694 + 22 - 1 : 1694] = {{4{mout_77[18-1]}}, mout_77} & {22{op_out_pvld[38]}}; 
wire [18-1:0] mout_78;
wire [18-1:0] mout_79;
DW02_multp #(8, 8, 18) mul39 (
.a(wt_actv_data39),
.b(dat_actv_data39),
.tc(1'b1),
.out0(mout_78),
.out1(mout_79)
);
assign op_out_pvld[39] = wt_actv_pvld[39] & dat_actv_pvld[39] & wt_actv_nz39 & dat_actv_nz39;

assign full_mul_result[1716 + 22 - 1 : 1716] = {{4{mout_78[18-1]}}, mout_78} & {22{op_out_pvld[39]}}; 
assign full_mul_result[1738 + 22 - 1 : 1738] = {{4{mout_79[18-1]}}, mout_79} & {22{op_out_pvld[39]}}; 
wire [18-1:0] mout_80;
wire [18-1:0] mout_81;
DW02_multp #(8, 8, 18) mul40 (
.a(wt_actv_data40),
.b(dat_actv_data40),
.tc(1'b1),
.out0(mout_80),
.out1(mout_81)
);
assign op_out_pvld[40] = wt_actv_pvld[40] & dat_actv_pvld[40] & wt_actv_nz40 & dat_actv_nz40;

assign full_mul_result[1760 + 22 - 1 : 1760] = {{4{mout_80[18-1]}}, mout_80} & {22{op_out_pvld[40]}}; 
assign full_mul_result[1782 + 22 - 1 : 1782] = {{4{mout_81[18-1]}}, mout_81} & {22{op_out_pvld[40]}}; 
wire [18-1:0] mout_82;
wire [18-1:0] mout_83;
DW02_multp #(8, 8, 18) mul41 (
.a(wt_actv_data41),
.b(dat_actv_data41),
.tc(1'b1),
.out0(mout_82),
.out1(mout_83)
);
assign op_out_pvld[41] = wt_actv_pvld[41] & dat_actv_pvld[41] & wt_actv_nz41 & dat_actv_nz41;

assign full_mul_result[1804 + 22 - 1 : 1804] = {{4{mout_82[18-1]}}, mout_82} & {22{op_out_pvld[41]}}; 
assign full_mul_result[1826 + 22 - 1 : 1826] = {{4{mout_83[18-1]}}, mout_83} & {22{op_out_pvld[41]}}; 
wire [18-1:0] mout_84;
wire [18-1:0] mout_85;
DW02_multp #(8, 8, 18) mul42 (
.a(wt_actv_data42),
.b(dat_actv_data42),
.tc(1'b1),
.out0(mout_84),
.out1(mout_85)
);
assign op_out_pvld[42] = wt_actv_pvld[42] & dat_actv_pvld[42] & wt_actv_nz42 & dat_actv_nz42;

assign full_mul_result[1848 + 22 - 1 : 1848] = {{4{mout_84[18-1]}}, mout_84} & {22{op_out_pvld[42]}}; 
assign full_mul_result[1870 + 22 - 1 : 1870] = {{4{mout_85[18-1]}}, mout_85} & {22{op_out_pvld[42]}}; 
wire [18-1:0] mout_86;
wire [18-1:0] mout_87;
DW02_multp #(8, 8, 18) mul43 (
.a(wt_actv_data43),
.b(dat_actv_data43),
.tc(1'b1),
.out0(mout_86),
.out1(mout_87)
);
assign op_out_pvld[43] = wt_actv_pvld[43] & dat_actv_pvld[43] & wt_actv_nz43 & dat_actv_nz43;

assign full_mul_result[1892 + 22 - 1 : 1892] = {{4{mout_86[18-1]}}, mout_86} & {22{op_out_pvld[43]}}; 
assign full_mul_result[1914 + 22 - 1 : 1914] = {{4{mout_87[18-1]}}, mout_87} & {22{op_out_pvld[43]}}; 
wire [18-1:0] mout_88;
wire [18-1:0] mout_89;
DW02_multp #(8, 8, 18) mul44 (
.a(wt_actv_data44),
.b(dat_actv_data44),
.tc(1'b1),
.out0(mout_88),
.out1(mout_89)
);
assign op_out_pvld[44] = wt_actv_pvld[44] & dat_actv_pvld[44] & wt_actv_nz44 & dat_actv_nz44;

assign full_mul_result[1936 + 22 - 1 : 1936] = {{4{mout_88[18-1]}}, mout_88} & {22{op_out_pvld[44]}}; 
assign full_mul_result[1958 + 22 - 1 : 1958] = {{4{mout_89[18-1]}}, mout_89} & {22{op_out_pvld[44]}}; 
wire [18-1:0] mout_90;
wire [18-1:0] mout_91;
DW02_multp #(8, 8, 18) mul45 (
.a(wt_actv_data45),
.b(dat_actv_data45),
.tc(1'b1),
.out0(mout_90),
.out1(mout_91)
);
assign op_out_pvld[45] = wt_actv_pvld[45] & dat_actv_pvld[45] & wt_actv_nz45 & dat_actv_nz45;

assign full_mul_result[1980 + 22 - 1 : 1980] = {{4{mout_90[18-1]}}, mout_90} & {22{op_out_pvld[45]}}; 
assign full_mul_result[2002 + 22 - 1 : 2002] = {{4{mout_91[18-1]}}, mout_91} & {22{op_out_pvld[45]}}; 
wire [18-1:0] mout_92;
wire [18-1:0] mout_93;
DW02_multp #(8, 8, 18) mul46 (
.a(wt_actv_data46),
.b(dat_actv_data46),
.tc(1'b1),
.out0(mout_92),
.out1(mout_93)
);
assign op_out_pvld[46] = wt_actv_pvld[46] & dat_actv_pvld[46] & wt_actv_nz46 & dat_actv_nz46;

assign full_mul_result[2024 + 22 - 1 : 2024] = {{4{mout_92[18-1]}}, mout_92} & {22{op_out_pvld[46]}}; 
assign full_mul_result[2046 + 22 - 1 : 2046] = {{4{mout_93[18-1]}}, mout_93} & {22{op_out_pvld[46]}}; 
wire [18-1:0] mout_94;
wire [18-1:0] mout_95;
DW02_multp #(8, 8, 18) mul47 (
.a(wt_actv_data47),
.b(dat_actv_data47),
.tc(1'b1),
.out0(mout_94),
.out1(mout_95)
);
assign op_out_pvld[47] = wt_actv_pvld[47] & dat_actv_pvld[47] & wt_actv_nz47 & dat_actv_nz47;

assign full_mul_result[2068 + 22 - 1 : 2068] = {{4{mout_94[18-1]}}, mout_94} & {22{op_out_pvld[47]}}; 
assign full_mul_result[2090 + 22 - 1 : 2090] = {{4{mout_95[18-1]}}, mout_95} & {22{op_out_pvld[47]}}; 
wire [18-1:0] mout_96;
wire [18-1:0] mout_97;
DW02_multp #(8, 8, 18) mul48 (
.a(wt_actv_data48),
.b(dat_actv_data48),
.tc(1'b1),
.out0(mout_96),
.out1(mout_97)
);
assign op_out_pvld[48] = wt_actv_pvld[48] & dat_actv_pvld[48] & wt_actv_nz48 & dat_actv_nz48;

assign full_mul_result[2112 + 22 - 1 : 2112] = {{4{mout_96[18-1]}}, mout_96} & {22{op_out_pvld[48]}}; 
assign full_mul_result[2134 + 22 - 1 : 2134] = {{4{mout_97[18-1]}}, mout_97} & {22{op_out_pvld[48]}}; 
wire [18-1:0] mout_98;
wire [18-1:0] mout_99;
DW02_multp #(8, 8, 18) mul49 (
.a(wt_actv_data49),
.b(dat_actv_data49),
.tc(1'b1),
.out0(mout_98),
.out1(mout_99)
);
assign op_out_pvld[49] = wt_actv_pvld[49] & dat_actv_pvld[49] & wt_actv_nz49 & dat_actv_nz49;

assign full_mul_result[2156 + 22 - 1 : 2156] = {{4{mout_98[18-1]}}, mout_98} & {22{op_out_pvld[49]}}; 
assign full_mul_result[2178 + 22 - 1 : 2178] = {{4{mout_99[18-1]}}, mout_99} & {22{op_out_pvld[49]}}; 
wire [18-1:0] mout_100;
wire [18-1:0] mout_101;
DW02_multp #(8, 8, 18) mul50 (
.a(wt_actv_data50),
.b(dat_actv_data50),
.tc(1'b1),
.out0(mout_100),
.out1(mout_101)
);
assign op_out_pvld[50] = wt_actv_pvld[50] & dat_actv_pvld[50] & wt_actv_nz50 & dat_actv_nz50;

assign full_mul_result[2200 + 22 - 1 : 2200] = {{4{mout_100[18-1]}}, mout_100} & {22{op_out_pvld[50]}}; 
assign full_mul_result[2222 + 22 - 1 : 2222] = {{4{mout_101[18-1]}}, mout_101} & {22{op_out_pvld[50]}}; 
wire [18-1:0] mout_102;
wire [18-1:0] mout_103;
DW02_multp #(8, 8, 18) mul51 (
.a(wt_actv_data51),
.b(dat_actv_data51),
.tc(1'b1),
.out0(mout_102),
.out1(mout_103)
);
assign op_out_pvld[51] = wt_actv_pvld[51] & dat_actv_pvld[51] & wt_actv_nz51 & dat_actv_nz51;

assign full_mul_result[2244 + 22 - 1 : 2244] = {{4{mout_102[18-1]}}, mout_102} & {22{op_out_pvld[51]}}; 
assign full_mul_result[2266 + 22 - 1 : 2266] = {{4{mout_103[18-1]}}, mout_103} & {22{op_out_pvld[51]}}; 
wire [18-1:0] mout_104;
wire [18-1:0] mout_105;
DW02_multp #(8, 8, 18) mul52 (
.a(wt_actv_data52),
.b(dat_actv_data52),
.tc(1'b1),
.out0(mout_104),
.out1(mout_105)
);
assign op_out_pvld[52] = wt_actv_pvld[52] & dat_actv_pvld[52] & wt_actv_nz52 & dat_actv_nz52;

assign full_mul_result[2288 + 22 - 1 : 2288] = {{4{mout_104[18-1]}}, mout_104} & {22{op_out_pvld[52]}}; 
assign full_mul_result[2310 + 22 - 1 : 2310] = {{4{mout_105[18-1]}}, mout_105} & {22{op_out_pvld[52]}}; 
wire [18-1:0] mout_106;
wire [18-1:0] mout_107;
DW02_multp #(8, 8, 18) mul53 (
.a(wt_actv_data53),
.b(dat_actv_data53),
.tc(1'b1),
.out0(mout_106),
.out1(mout_107)
);
assign op_out_pvld[53] = wt_actv_pvld[53] & dat_actv_pvld[53] & wt_actv_nz53 & dat_actv_nz53;

assign full_mul_result[2332 + 22 - 1 : 2332] = {{4{mout_106[18-1]}}, mout_106} & {22{op_out_pvld[53]}}; 
assign full_mul_result[2354 + 22 - 1 : 2354] = {{4{mout_107[18-1]}}, mout_107} & {22{op_out_pvld[53]}}; 
wire [18-1:0] mout_108;
wire [18-1:0] mout_109;
DW02_multp #(8, 8, 18) mul54 (
.a(wt_actv_data54),
.b(dat_actv_data54),
.tc(1'b1),
.out0(mout_108),
.out1(mout_109)
);
assign op_out_pvld[54] = wt_actv_pvld[54] & dat_actv_pvld[54] & wt_actv_nz54 & dat_actv_nz54;

assign full_mul_result[2376 + 22 - 1 : 2376] = {{4{mout_108[18-1]}}, mout_108} & {22{op_out_pvld[54]}}; 
assign full_mul_result[2398 + 22 - 1 : 2398] = {{4{mout_109[18-1]}}, mout_109} & {22{op_out_pvld[54]}}; 
wire [18-1:0] mout_110;
wire [18-1:0] mout_111;
DW02_multp #(8, 8, 18) mul55 (
.a(wt_actv_data55),
.b(dat_actv_data55),
.tc(1'b1),
.out0(mout_110),
.out1(mout_111)
);
assign op_out_pvld[55] = wt_actv_pvld[55] & dat_actv_pvld[55] & wt_actv_nz55 & dat_actv_nz55;

assign full_mul_result[2420 + 22 - 1 : 2420] = {{4{mout_110[18-1]}}, mout_110} & {22{op_out_pvld[55]}}; 
assign full_mul_result[2442 + 22 - 1 : 2442] = {{4{mout_111[18-1]}}, mout_111} & {22{op_out_pvld[55]}}; 
wire [18-1:0] mout_112;
wire [18-1:0] mout_113;
DW02_multp #(8, 8, 18) mul56 (
.a(wt_actv_data56),
.b(dat_actv_data56),
.tc(1'b1),
.out0(mout_112),
.out1(mout_113)
);
assign op_out_pvld[56] = wt_actv_pvld[56] & dat_actv_pvld[56] & wt_actv_nz56 & dat_actv_nz56;

assign full_mul_result[2464 + 22 - 1 : 2464] = {{4{mout_112[18-1]}}, mout_112} & {22{op_out_pvld[56]}}; 
assign full_mul_result[2486 + 22 - 1 : 2486] = {{4{mout_113[18-1]}}, mout_113} & {22{op_out_pvld[56]}}; 
wire [18-1:0] mout_114;
wire [18-1:0] mout_115;
DW02_multp #(8, 8, 18) mul57 (
.a(wt_actv_data57),
.b(dat_actv_data57),
.tc(1'b1),
.out0(mout_114),
.out1(mout_115)
);
assign op_out_pvld[57] = wt_actv_pvld[57] & dat_actv_pvld[57] & wt_actv_nz57 & dat_actv_nz57;

assign full_mul_result[2508 + 22 - 1 : 2508] = {{4{mout_114[18-1]}}, mout_114} & {22{op_out_pvld[57]}}; 
assign full_mul_result[2530 + 22 - 1 : 2530] = {{4{mout_115[18-1]}}, mout_115} & {22{op_out_pvld[57]}}; 
wire [18-1:0] mout_116;
wire [18-1:0] mout_117;
DW02_multp #(8, 8, 18) mul58 (
.a(wt_actv_data58),
.b(dat_actv_data58),
.tc(1'b1),
.out0(mout_116),
.out1(mout_117)
);
assign op_out_pvld[58] = wt_actv_pvld[58] & dat_actv_pvld[58] & wt_actv_nz58 & dat_actv_nz58;

assign full_mul_result[2552 + 22 - 1 : 2552] = {{4{mout_116[18-1]}}, mout_116} & {22{op_out_pvld[58]}}; 
assign full_mul_result[2574 + 22 - 1 : 2574] = {{4{mout_117[18-1]}}, mout_117} & {22{op_out_pvld[58]}}; 
wire [18-1:0] mout_118;
wire [18-1:0] mout_119;
DW02_multp #(8, 8, 18) mul59 (
.a(wt_actv_data59),
.b(dat_actv_data59),
.tc(1'b1),
.out0(mout_118),
.out1(mout_119)
);
assign op_out_pvld[59] = wt_actv_pvld[59] & dat_actv_pvld[59] & wt_actv_nz59 & dat_actv_nz59;

assign full_mul_result[2596 + 22 - 1 : 2596] = {{4{mout_118[18-1]}}, mout_118} & {22{op_out_pvld[59]}}; 
assign full_mul_result[2618 + 22 - 1 : 2618] = {{4{mout_119[18-1]}}, mout_119} & {22{op_out_pvld[59]}}; 
wire [18-1:0] mout_120;
wire [18-1:0] mout_121;
DW02_multp #(8, 8, 18) mul60 (
.a(wt_actv_data60),
.b(dat_actv_data60),
.tc(1'b1),
.out0(mout_120),
.out1(mout_121)
);
assign op_out_pvld[60] = wt_actv_pvld[60] & dat_actv_pvld[60] & wt_actv_nz60 & dat_actv_nz60;

assign full_mul_result[2640 + 22 - 1 : 2640] = {{4{mout_120[18-1]}}, mout_120} & {22{op_out_pvld[60]}}; 
assign full_mul_result[2662 + 22 - 1 : 2662] = {{4{mout_121[18-1]}}, mout_121} & {22{op_out_pvld[60]}}; 
wire [18-1:0] mout_122;
wire [18-1:0] mout_123;
DW02_multp #(8, 8, 18) mul61 (
.a(wt_actv_data61),
.b(dat_actv_data61),
.tc(1'b1),
.out0(mout_122),
.out1(mout_123)
);
assign op_out_pvld[61] = wt_actv_pvld[61] & dat_actv_pvld[61] & wt_actv_nz61 & dat_actv_nz61;

assign full_mul_result[2684 + 22 - 1 : 2684] = {{4{mout_122[18-1]}}, mout_122} & {22{op_out_pvld[61]}}; 
assign full_mul_result[2706 + 22 - 1 : 2706] = {{4{mout_123[18-1]}}, mout_123} & {22{op_out_pvld[61]}}; 
wire [18-1:0] mout_124;
wire [18-1:0] mout_125;
DW02_multp #(8, 8, 18) mul62 (
.a(wt_actv_data62),
.b(dat_actv_data62),
.tc(1'b1),
.out0(mout_124),
.out1(mout_125)
);
assign op_out_pvld[62] = wt_actv_pvld[62] & dat_actv_pvld[62] & wt_actv_nz62 & dat_actv_nz62;

assign full_mul_result[2728 + 22 - 1 : 2728] = {{4{mout_124[18-1]}}, mout_124} & {22{op_out_pvld[62]}}; 
assign full_mul_result[2750 + 22 - 1 : 2750] = {{4{mout_125[18-1]}}, mout_125} & {22{op_out_pvld[62]}}; 
wire [18-1:0] mout_126;
wire [18-1:0] mout_127;
DW02_multp #(8, 8, 18) mul63 (
.a(wt_actv_data63),
.b(dat_actv_data63),
.tc(1'b1),
.out0(mout_126),
.out1(mout_127)
);
assign op_out_pvld[63] = wt_actv_pvld[63] & dat_actv_pvld[63] & wt_actv_nz63 & dat_actv_nz63;

assign full_mul_result[2772 + 22 - 1 : 2772] = {{4{mout_126[18-1]}}, mout_126} & {22{op_out_pvld[63]}}; 
assign full_mul_result[2794 + 22 - 1 : 2794] = {{4{mout_127[18-1]}}, mout_127} & {22{op_out_pvld[63]}}; 
//| eperl: generated_end (DO NOT EDIT ABOVE)
DW02_sum #(64*2, 22) fsum (.INPUT(full_mul_result), .SUM(sum_out));
`endif
//add pipeline for retiming
wire pp_pvld_d0 = (dat_actv_pvld[0] & wt_actv_pvld[0]);
//wire [22 -1:0] sum_out_d0 = $unsigned(sum_out);
wire [22 -1:0] sum_out_d0 = sum_out;
//: my $rwidth = 22;
//: my $rr=3;
//: &eperl::retime("-stage ${rr} -o sum_out_dd -i sum_out_d0 -cg_en_i pp_pvld_d0 -cg_en_o pp_pvld_dd -cg_en_rtm -wid $rwidth");
//| eperl: generated_beg (DO NOT EDIT BELOW)
reg [22-1:0] sum_out_d0_d1;
always @(posedge nvdla_core_clk) begin
    if ((pp_pvld_d0)) begin
        sum_out_d0_d1[22-1:0] <= sum_out_d0[22-1:0];
    end
end

reg pp_pvld_d0_d1;
always @(posedge nvdla_core_clk) begin
    pp_pvld_d0_d1 <= pp_pvld_d0;
end

reg [22-1:0] sum_out_d0_d2;
always @(posedge nvdla_core_clk) begin
    if ((pp_pvld_d0_d1)) begin
        sum_out_d0_d2[22-1:0] <= sum_out_d0_d1[22-1:0];
    end
end

reg pp_pvld_d0_d2;
always @(posedge nvdla_core_clk) begin
    pp_pvld_d0_d2 <= pp_pvld_d0_d1;
end

reg [22-1:0] sum_out_d0_d3;
always @(posedge nvdla_core_clk) begin
    if ((pp_pvld_d0_d2)) begin
        sum_out_d0_d3[22-1:0] <= sum_out_d0_d2[22-1:0];
    end
end

reg pp_pvld_d0_d3;
always @(posedge nvdla_core_clk) begin
    pp_pvld_d0_d3 <= pp_pvld_d0_d2;
end

wire [22-1:0] sum_out_dd;
assign sum_out_dd = sum_out_d0_d3;

wire pp_pvld_dd;
assign pp_pvld_dd = pp_pvld_d0_d3;


//| eperl: generated_end (DO NOT EDIT ABOVE)
assign mac_out_pvld=pp_pvld_dd;
assign mac_out_data=sum_out_dd;
endmodule // NV_NVDLA_CMAC_CORE_mac
