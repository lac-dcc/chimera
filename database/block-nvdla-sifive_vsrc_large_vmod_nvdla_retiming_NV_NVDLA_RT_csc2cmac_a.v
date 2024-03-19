// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_RT_csc2cmac_a.v
// ================================================================
// NVDLA Open Source Project
// 
// Copyright(c) 2016 - 2017 NVIDIA Corporation.  Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with 
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_CSC.h
    //entry bits
    //atomC
    //in bytes, entry/8
    //CSC_ENTRY_HEX/2
    //CSC_ENTRY_HEX/4
    //CSC_ENTRY_HEX-1
    //atomK
    //atomK
    //atomK*2
//notice, for image case, first atom OP within one strip OP must fetch from entry align place, in the middle of an entry is not supported.
//thus, when atomC/atomK=4, stripe=4*atomK, feature data still keeps atomK*2
    `define CC_ATOMC_DIV_ATOMK_EQUAL_2
//batch keep 1
module NV_NVDLA_RT_csc2cmac_a (
   nvdla_core_clk
  ,nvdla_core_rstn
  ,sc2mac_wt_src_pvld
  ,sc2mac_wt_src_mask
//: for(my $i=0; $i<64; $i++){
//: print ",sc2mac_wt_src_data${i} \n";
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
,sc2mac_wt_src_data0 
,sc2mac_wt_src_data1 
,sc2mac_wt_src_data2 
,sc2mac_wt_src_data3 
,sc2mac_wt_src_data4 
,sc2mac_wt_src_data5 
,sc2mac_wt_src_data6 
,sc2mac_wt_src_data7 
,sc2mac_wt_src_data8 
,sc2mac_wt_src_data9 
,sc2mac_wt_src_data10 
,sc2mac_wt_src_data11 
,sc2mac_wt_src_data12 
,sc2mac_wt_src_data13 
,sc2mac_wt_src_data14 
,sc2mac_wt_src_data15 
,sc2mac_wt_src_data16 
,sc2mac_wt_src_data17 
,sc2mac_wt_src_data18 
,sc2mac_wt_src_data19 
,sc2mac_wt_src_data20 
,sc2mac_wt_src_data21 
,sc2mac_wt_src_data22 
,sc2mac_wt_src_data23 
,sc2mac_wt_src_data24 
,sc2mac_wt_src_data25 
,sc2mac_wt_src_data26 
,sc2mac_wt_src_data27 
,sc2mac_wt_src_data28 
,sc2mac_wt_src_data29 
,sc2mac_wt_src_data30 
,sc2mac_wt_src_data31 
,sc2mac_wt_src_data32 
,sc2mac_wt_src_data33 
,sc2mac_wt_src_data34 
,sc2mac_wt_src_data35 
,sc2mac_wt_src_data36 
,sc2mac_wt_src_data37 
,sc2mac_wt_src_data38 
,sc2mac_wt_src_data39 
,sc2mac_wt_src_data40 
,sc2mac_wt_src_data41 
,sc2mac_wt_src_data42 
,sc2mac_wt_src_data43 
,sc2mac_wt_src_data44 
,sc2mac_wt_src_data45 
,sc2mac_wt_src_data46 
,sc2mac_wt_src_data47 
,sc2mac_wt_src_data48 
,sc2mac_wt_src_data49 
,sc2mac_wt_src_data50 
,sc2mac_wt_src_data51 
,sc2mac_wt_src_data52 
,sc2mac_wt_src_data53 
,sc2mac_wt_src_data54 
,sc2mac_wt_src_data55 
,sc2mac_wt_src_data56 
,sc2mac_wt_src_data57 
,sc2mac_wt_src_data58 
,sc2mac_wt_src_data59 
,sc2mac_wt_src_data60 
,sc2mac_wt_src_data61 
,sc2mac_wt_src_data62 
,sc2mac_wt_src_data63 

//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,sc2mac_wt_src_sel
  ,sc2mac_dat_src_pvld
  ,sc2mac_dat_src_mask
//: for(my $i=0; $i<64; $i++){
//: print ",sc2mac_dat_src_data${i} \n";
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
,sc2mac_dat_src_data0 
,sc2mac_dat_src_data1 
,sc2mac_dat_src_data2 
,sc2mac_dat_src_data3 
,sc2mac_dat_src_data4 
,sc2mac_dat_src_data5 
,sc2mac_dat_src_data6 
,sc2mac_dat_src_data7 
,sc2mac_dat_src_data8 
,sc2mac_dat_src_data9 
,sc2mac_dat_src_data10 
,sc2mac_dat_src_data11 
,sc2mac_dat_src_data12 
,sc2mac_dat_src_data13 
,sc2mac_dat_src_data14 
,sc2mac_dat_src_data15 
,sc2mac_dat_src_data16 
,sc2mac_dat_src_data17 
,sc2mac_dat_src_data18 
,sc2mac_dat_src_data19 
,sc2mac_dat_src_data20 
,sc2mac_dat_src_data21 
,sc2mac_dat_src_data22 
,sc2mac_dat_src_data23 
,sc2mac_dat_src_data24 
,sc2mac_dat_src_data25 
,sc2mac_dat_src_data26 
,sc2mac_dat_src_data27 
,sc2mac_dat_src_data28 
,sc2mac_dat_src_data29 
,sc2mac_dat_src_data30 
,sc2mac_dat_src_data31 
,sc2mac_dat_src_data32 
,sc2mac_dat_src_data33 
,sc2mac_dat_src_data34 
,sc2mac_dat_src_data35 
,sc2mac_dat_src_data36 
,sc2mac_dat_src_data37 
,sc2mac_dat_src_data38 
,sc2mac_dat_src_data39 
,sc2mac_dat_src_data40 
,sc2mac_dat_src_data41 
,sc2mac_dat_src_data42 
,sc2mac_dat_src_data43 
,sc2mac_dat_src_data44 
,sc2mac_dat_src_data45 
,sc2mac_dat_src_data46 
,sc2mac_dat_src_data47 
,sc2mac_dat_src_data48 
,sc2mac_dat_src_data49 
,sc2mac_dat_src_data50 
,sc2mac_dat_src_data51 
,sc2mac_dat_src_data52 
,sc2mac_dat_src_data53 
,sc2mac_dat_src_data54 
,sc2mac_dat_src_data55 
,sc2mac_dat_src_data56 
,sc2mac_dat_src_data57 
,sc2mac_dat_src_data58 
,sc2mac_dat_src_data59 
,sc2mac_dat_src_data60 
,sc2mac_dat_src_data61 
,sc2mac_dat_src_data62 
,sc2mac_dat_src_data63 

//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,sc2mac_dat_src_pd
  ,sc2mac_wt_dst_pvld
  ,sc2mac_wt_dst_mask
//: for(my $i=0; $i<64; $i++){
//: print ",sc2mac_wt_dst_data${i} \n";
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
,sc2mac_wt_dst_data0 
,sc2mac_wt_dst_data1 
,sc2mac_wt_dst_data2 
,sc2mac_wt_dst_data3 
,sc2mac_wt_dst_data4 
,sc2mac_wt_dst_data5 
,sc2mac_wt_dst_data6 
,sc2mac_wt_dst_data7 
,sc2mac_wt_dst_data8 
,sc2mac_wt_dst_data9 
,sc2mac_wt_dst_data10 
,sc2mac_wt_dst_data11 
,sc2mac_wt_dst_data12 
,sc2mac_wt_dst_data13 
,sc2mac_wt_dst_data14 
,sc2mac_wt_dst_data15 
,sc2mac_wt_dst_data16 
,sc2mac_wt_dst_data17 
,sc2mac_wt_dst_data18 
,sc2mac_wt_dst_data19 
,sc2mac_wt_dst_data20 
,sc2mac_wt_dst_data21 
,sc2mac_wt_dst_data22 
,sc2mac_wt_dst_data23 
,sc2mac_wt_dst_data24 
,sc2mac_wt_dst_data25 
,sc2mac_wt_dst_data26 
,sc2mac_wt_dst_data27 
,sc2mac_wt_dst_data28 
,sc2mac_wt_dst_data29 
,sc2mac_wt_dst_data30 
,sc2mac_wt_dst_data31 
,sc2mac_wt_dst_data32 
,sc2mac_wt_dst_data33 
,sc2mac_wt_dst_data34 
,sc2mac_wt_dst_data35 
,sc2mac_wt_dst_data36 
,sc2mac_wt_dst_data37 
,sc2mac_wt_dst_data38 
,sc2mac_wt_dst_data39 
,sc2mac_wt_dst_data40 
,sc2mac_wt_dst_data41 
,sc2mac_wt_dst_data42 
,sc2mac_wt_dst_data43 
,sc2mac_wt_dst_data44 
,sc2mac_wt_dst_data45 
,sc2mac_wt_dst_data46 
,sc2mac_wt_dst_data47 
,sc2mac_wt_dst_data48 
,sc2mac_wt_dst_data49 
,sc2mac_wt_dst_data50 
,sc2mac_wt_dst_data51 
,sc2mac_wt_dst_data52 
,sc2mac_wt_dst_data53 
,sc2mac_wt_dst_data54 
,sc2mac_wt_dst_data55 
,sc2mac_wt_dst_data56 
,sc2mac_wt_dst_data57 
,sc2mac_wt_dst_data58 
,sc2mac_wt_dst_data59 
,sc2mac_wt_dst_data60 
,sc2mac_wt_dst_data61 
,sc2mac_wt_dst_data62 
,sc2mac_wt_dst_data63 

//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,sc2mac_wt_dst_sel
  ,sc2mac_dat_dst_pvld
  ,sc2mac_dat_dst_mask
//: for(my $i=0; $i<64; $i++){
//: print ",sc2mac_dat_dst_data${i} \n";
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
,sc2mac_dat_dst_data0 
,sc2mac_dat_dst_data1 
,sc2mac_dat_dst_data2 
,sc2mac_dat_dst_data3 
,sc2mac_dat_dst_data4 
,sc2mac_dat_dst_data5 
,sc2mac_dat_dst_data6 
,sc2mac_dat_dst_data7 
,sc2mac_dat_dst_data8 
,sc2mac_dat_dst_data9 
,sc2mac_dat_dst_data10 
,sc2mac_dat_dst_data11 
,sc2mac_dat_dst_data12 
,sc2mac_dat_dst_data13 
,sc2mac_dat_dst_data14 
,sc2mac_dat_dst_data15 
,sc2mac_dat_dst_data16 
,sc2mac_dat_dst_data17 
,sc2mac_dat_dst_data18 
,sc2mac_dat_dst_data19 
,sc2mac_dat_dst_data20 
,sc2mac_dat_dst_data21 
,sc2mac_dat_dst_data22 
,sc2mac_dat_dst_data23 
,sc2mac_dat_dst_data24 
,sc2mac_dat_dst_data25 
,sc2mac_dat_dst_data26 
,sc2mac_dat_dst_data27 
,sc2mac_dat_dst_data28 
,sc2mac_dat_dst_data29 
,sc2mac_dat_dst_data30 
,sc2mac_dat_dst_data31 
,sc2mac_dat_dst_data32 
,sc2mac_dat_dst_data33 
,sc2mac_dat_dst_data34 
,sc2mac_dat_dst_data35 
,sc2mac_dat_dst_data36 
,sc2mac_dat_dst_data37 
,sc2mac_dat_dst_data38 
,sc2mac_dat_dst_data39 
,sc2mac_dat_dst_data40 
,sc2mac_dat_dst_data41 
,sc2mac_dat_dst_data42 
,sc2mac_dat_dst_data43 
,sc2mac_dat_dst_data44 
,sc2mac_dat_dst_data45 
,sc2mac_dat_dst_data46 
,sc2mac_dat_dst_data47 
,sc2mac_dat_dst_data48 
,sc2mac_dat_dst_data49 
,sc2mac_dat_dst_data50 
,sc2mac_dat_dst_data51 
,sc2mac_dat_dst_data52 
,sc2mac_dat_dst_data53 
,sc2mac_dat_dst_data54 
,sc2mac_dat_dst_data55 
,sc2mac_dat_dst_data56 
,sc2mac_dat_dst_data57 
,sc2mac_dat_dst_data58 
,sc2mac_dat_dst_data59 
,sc2mac_dat_dst_data60 
,sc2mac_dat_dst_data61 
,sc2mac_dat_dst_data62 
,sc2mac_dat_dst_data63 

//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,sc2mac_dat_dst_pd
  );
//
// NV_NVDLA_RT_csc2cmac_ports.v
//
input nvdla_core_clk;
input nvdla_core_rstn;
input sc2mac_wt_src_pvld; /* data valid */
input [64 -1:0] sc2mac_wt_src_mask;
//: my $bb=8;
//: for(my $i=0; $i<64; $i++){
//: print "input   [${bb}-1:0] sc2mac_wt_src_data${i};  \n";
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
input   [8-1:0] sc2mac_wt_src_data0;  
input   [8-1:0] sc2mac_wt_src_data1;  
input   [8-1:0] sc2mac_wt_src_data2;  
input   [8-1:0] sc2mac_wt_src_data3;  
input   [8-1:0] sc2mac_wt_src_data4;  
input   [8-1:0] sc2mac_wt_src_data5;  
input   [8-1:0] sc2mac_wt_src_data6;  
input   [8-1:0] sc2mac_wt_src_data7;  
input   [8-1:0] sc2mac_wt_src_data8;  
input   [8-1:0] sc2mac_wt_src_data9;  
input   [8-1:0] sc2mac_wt_src_data10;  
input   [8-1:0] sc2mac_wt_src_data11;  
input   [8-1:0] sc2mac_wt_src_data12;  
input   [8-1:0] sc2mac_wt_src_data13;  
input   [8-1:0] sc2mac_wt_src_data14;  
input   [8-1:0] sc2mac_wt_src_data15;  
input   [8-1:0] sc2mac_wt_src_data16;  
input   [8-1:0] sc2mac_wt_src_data17;  
input   [8-1:0] sc2mac_wt_src_data18;  
input   [8-1:0] sc2mac_wt_src_data19;  
input   [8-1:0] sc2mac_wt_src_data20;  
input   [8-1:0] sc2mac_wt_src_data21;  
input   [8-1:0] sc2mac_wt_src_data22;  
input   [8-1:0] sc2mac_wt_src_data23;  
input   [8-1:0] sc2mac_wt_src_data24;  
input   [8-1:0] sc2mac_wt_src_data25;  
input   [8-1:0] sc2mac_wt_src_data26;  
input   [8-1:0] sc2mac_wt_src_data27;  
input   [8-1:0] sc2mac_wt_src_data28;  
input   [8-1:0] sc2mac_wt_src_data29;  
input   [8-1:0] sc2mac_wt_src_data30;  
input   [8-1:0] sc2mac_wt_src_data31;  
input   [8-1:0] sc2mac_wt_src_data32;  
input   [8-1:0] sc2mac_wt_src_data33;  
input   [8-1:0] sc2mac_wt_src_data34;  
input   [8-1:0] sc2mac_wt_src_data35;  
input   [8-1:0] sc2mac_wt_src_data36;  
input   [8-1:0] sc2mac_wt_src_data37;  
input   [8-1:0] sc2mac_wt_src_data38;  
input   [8-1:0] sc2mac_wt_src_data39;  
input   [8-1:0] sc2mac_wt_src_data40;  
input   [8-1:0] sc2mac_wt_src_data41;  
input   [8-1:0] sc2mac_wt_src_data42;  
input   [8-1:0] sc2mac_wt_src_data43;  
input   [8-1:0] sc2mac_wt_src_data44;  
input   [8-1:0] sc2mac_wt_src_data45;  
input   [8-1:0] sc2mac_wt_src_data46;  
input   [8-1:0] sc2mac_wt_src_data47;  
input   [8-1:0] sc2mac_wt_src_data48;  
input   [8-1:0] sc2mac_wt_src_data49;  
input   [8-1:0] sc2mac_wt_src_data50;  
input   [8-1:0] sc2mac_wt_src_data51;  
input   [8-1:0] sc2mac_wt_src_data52;  
input   [8-1:0] sc2mac_wt_src_data53;  
input   [8-1:0] sc2mac_wt_src_data54;  
input   [8-1:0] sc2mac_wt_src_data55;  
input   [8-1:0] sc2mac_wt_src_data56;  
input   [8-1:0] sc2mac_wt_src_data57;  
input   [8-1:0] sc2mac_wt_src_data58;  
input   [8-1:0] sc2mac_wt_src_data59;  
input   [8-1:0] sc2mac_wt_src_data60;  
input   [8-1:0] sc2mac_wt_src_data61;  
input   [8-1:0] sc2mac_wt_src_data62;  
input   [8-1:0] sc2mac_wt_src_data63;  

//| eperl: generated_end (DO NOT EDIT ABOVE)
input [32/2 -1:0] sc2mac_wt_src_sel;
input sc2mac_dat_src_pvld; /* data valid */
input [64 -1:0] sc2mac_dat_src_mask;
//: my $bb=8;
//: for(my $i=0; $i<64; $i++){
//: print "input   [${bb}-1:0] sc2mac_dat_src_data${i};  \n";
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
input   [8-1:0] sc2mac_dat_src_data0;  
input   [8-1:0] sc2mac_dat_src_data1;  
input   [8-1:0] sc2mac_dat_src_data2;  
input   [8-1:0] sc2mac_dat_src_data3;  
input   [8-1:0] sc2mac_dat_src_data4;  
input   [8-1:0] sc2mac_dat_src_data5;  
input   [8-1:0] sc2mac_dat_src_data6;  
input   [8-1:0] sc2mac_dat_src_data7;  
input   [8-1:0] sc2mac_dat_src_data8;  
input   [8-1:0] sc2mac_dat_src_data9;  
input   [8-1:0] sc2mac_dat_src_data10;  
input   [8-1:0] sc2mac_dat_src_data11;  
input   [8-1:0] sc2mac_dat_src_data12;  
input   [8-1:0] sc2mac_dat_src_data13;  
input   [8-1:0] sc2mac_dat_src_data14;  
input   [8-1:0] sc2mac_dat_src_data15;  
input   [8-1:0] sc2mac_dat_src_data16;  
input   [8-1:0] sc2mac_dat_src_data17;  
input   [8-1:0] sc2mac_dat_src_data18;  
input   [8-1:0] sc2mac_dat_src_data19;  
input   [8-1:0] sc2mac_dat_src_data20;  
input   [8-1:0] sc2mac_dat_src_data21;  
input   [8-1:0] sc2mac_dat_src_data22;  
input   [8-1:0] sc2mac_dat_src_data23;  
input   [8-1:0] sc2mac_dat_src_data24;  
input   [8-1:0] sc2mac_dat_src_data25;  
input   [8-1:0] sc2mac_dat_src_data26;  
input   [8-1:0] sc2mac_dat_src_data27;  
input   [8-1:0] sc2mac_dat_src_data28;  
input   [8-1:0] sc2mac_dat_src_data29;  
input   [8-1:0] sc2mac_dat_src_data30;  
input   [8-1:0] sc2mac_dat_src_data31;  
input   [8-1:0] sc2mac_dat_src_data32;  
input   [8-1:0] sc2mac_dat_src_data33;  
input   [8-1:0] sc2mac_dat_src_data34;  
input   [8-1:0] sc2mac_dat_src_data35;  
input   [8-1:0] sc2mac_dat_src_data36;  
input   [8-1:0] sc2mac_dat_src_data37;  
input   [8-1:0] sc2mac_dat_src_data38;  
input   [8-1:0] sc2mac_dat_src_data39;  
input   [8-1:0] sc2mac_dat_src_data40;  
input   [8-1:0] sc2mac_dat_src_data41;  
input   [8-1:0] sc2mac_dat_src_data42;  
input   [8-1:0] sc2mac_dat_src_data43;  
input   [8-1:0] sc2mac_dat_src_data44;  
input   [8-1:0] sc2mac_dat_src_data45;  
input   [8-1:0] sc2mac_dat_src_data46;  
input   [8-1:0] sc2mac_dat_src_data47;  
input   [8-1:0] sc2mac_dat_src_data48;  
input   [8-1:0] sc2mac_dat_src_data49;  
input   [8-1:0] sc2mac_dat_src_data50;  
input   [8-1:0] sc2mac_dat_src_data51;  
input   [8-1:0] sc2mac_dat_src_data52;  
input   [8-1:0] sc2mac_dat_src_data53;  
input   [8-1:0] sc2mac_dat_src_data54;  
input   [8-1:0] sc2mac_dat_src_data55;  
input   [8-1:0] sc2mac_dat_src_data56;  
input   [8-1:0] sc2mac_dat_src_data57;  
input   [8-1:0] sc2mac_dat_src_data58;  
input   [8-1:0] sc2mac_dat_src_data59;  
input   [8-1:0] sc2mac_dat_src_data60;  
input   [8-1:0] sc2mac_dat_src_data61;  
input   [8-1:0] sc2mac_dat_src_data62;  
input   [8-1:0] sc2mac_dat_src_data63;  

//| eperl: generated_end (DO NOT EDIT ABOVE)
input [8:0] sc2mac_dat_src_pd;
output sc2mac_wt_dst_pvld; /* data valid */
output [64 -1:0] sc2mac_wt_dst_mask;
//: my $bb=8;
//: for(my $i=0; $i<64; $i++){
//: print "output   [${bb}-1:0] sc2mac_wt_dst_data${i};  \n";
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
output   [8-1:0] sc2mac_wt_dst_data0;  
output   [8-1:0] sc2mac_wt_dst_data1;  
output   [8-1:0] sc2mac_wt_dst_data2;  
output   [8-1:0] sc2mac_wt_dst_data3;  
output   [8-1:0] sc2mac_wt_dst_data4;  
output   [8-1:0] sc2mac_wt_dst_data5;  
output   [8-1:0] sc2mac_wt_dst_data6;  
output   [8-1:0] sc2mac_wt_dst_data7;  
output   [8-1:0] sc2mac_wt_dst_data8;  
output   [8-1:0] sc2mac_wt_dst_data9;  
output   [8-1:0] sc2mac_wt_dst_data10;  
output   [8-1:0] sc2mac_wt_dst_data11;  
output   [8-1:0] sc2mac_wt_dst_data12;  
output   [8-1:0] sc2mac_wt_dst_data13;  
output   [8-1:0] sc2mac_wt_dst_data14;  
output   [8-1:0] sc2mac_wt_dst_data15;  
output   [8-1:0] sc2mac_wt_dst_data16;  
output   [8-1:0] sc2mac_wt_dst_data17;  
output   [8-1:0] sc2mac_wt_dst_data18;  
output   [8-1:0] sc2mac_wt_dst_data19;  
output   [8-1:0] sc2mac_wt_dst_data20;  
output   [8-1:0] sc2mac_wt_dst_data21;  
output   [8-1:0] sc2mac_wt_dst_data22;  
output   [8-1:0] sc2mac_wt_dst_data23;  
output   [8-1:0] sc2mac_wt_dst_data24;  
output   [8-1:0] sc2mac_wt_dst_data25;  
output   [8-1:0] sc2mac_wt_dst_data26;  
output   [8-1:0] sc2mac_wt_dst_data27;  
output   [8-1:0] sc2mac_wt_dst_data28;  
output   [8-1:0] sc2mac_wt_dst_data29;  
output   [8-1:0] sc2mac_wt_dst_data30;  
output   [8-1:0] sc2mac_wt_dst_data31;  
output   [8-1:0] sc2mac_wt_dst_data32;  
output   [8-1:0] sc2mac_wt_dst_data33;  
output   [8-1:0] sc2mac_wt_dst_data34;  
output   [8-1:0] sc2mac_wt_dst_data35;  
output   [8-1:0] sc2mac_wt_dst_data36;  
output   [8-1:0] sc2mac_wt_dst_data37;  
output   [8-1:0] sc2mac_wt_dst_data38;  
output   [8-1:0] sc2mac_wt_dst_data39;  
output   [8-1:0] sc2mac_wt_dst_data40;  
output   [8-1:0] sc2mac_wt_dst_data41;  
output   [8-1:0] sc2mac_wt_dst_data42;  
output   [8-1:0] sc2mac_wt_dst_data43;  
output   [8-1:0] sc2mac_wt_dst_data44;  
output   [8-1:0] sc2mac_wt_dst_data45;  
output   [8-1:0] sc2mac_wt_dst_data46;  
output   [8-1:0] sc2mac_wt_dst_data47;  
output   [8-1:0] sc2mac_wt_dst_data48;  
output   [8-1:0] sc2mac_wt_dst_data49;  
output   [8-1:0] sc2mac_wt_dst_data50;  
output   [8-1:0] sc2mac_wt_dst_data51;  
output   [8-1:0] sc2mac_wt_dst_data52;  
output   [8-1:0] sc2mac_wt_dst_data53;  
output   [8-1:0] sc2mac_wt_dst_data54;  
output   [8-1:0] sc2mac_wt_dst_data55;  
output   [8-1:0] sc2mac_wt_dst_data56;  
output   [8-1:0] sc2mac_wt_dst_data57;  
output   [8-1:0] sc2mac_wt_dst_data58;  
output   [8-1:0] sc2mac_wt_dst_data59;  
output   [8-1:0] sc2mac_wt_dst_data60;  
output   [8-1:0] sc2mac_wt_dst_data61;  
output   [8-1:0] sc2mac_wt_dst_data62;  
output   [8-1:0] sc2mac_wt_dst_data63;  

//| eperl: generated_end (DO NOT EDIT ABOVE)
output [32/2 -1:0] sc2mac_wt_dst_sel;
output sc2mac_dat_dst_pvld; /* data valid */
output [64 -1:0] sc2mac_dat_dst_mask;
//: my $bb=8;
//: for(my $i=0; $i<64; $i++){
//: print "output   [${bb}-1:0] sc2mac_dat_dst_data${i};  \n";
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
output   [8-1:0] sc2mac_dat_dst_data0;  
output   [8-1:0] sc2mac_dat_dst_data1;  
output   [8-1:0] sc2mac_dat_dst_data2;  
output   [8-1:0] sc2mac_dat_dst_data3;  
output   [8-1:0] sc2mac_dat_dst_data4;  
output   [8-1:0] sc2mac_dat_dst_data5;  
output   [8-1:0] sc2mac_dat_dst_data6;  
output   [8-1:0] sc2mac_dat_dst_data7;  
output   [8-1:0] sc2mac_dat_dst_data8;  
output   [8-1:0] sc2mac_dat_dst_data9;  
output   [8-1:0] sc2mac_dat_dst_data10;  
output   [8-1:0] sc2mac_dat_dst_data11;  
output   [8-1:0] sc2mac_dat_dst_data12;  
output   [8-1:0] sc2mac_dat_dst_data13;  
output   [8-1:0] sc2mac_dat_dst_data14;  
output   [8-1:0] sc2mac_dat_dst_data15;  
output   [8-1:0] sc2mac_dat_dst_data16;  
output   [8-1:0] sc2mac_dat_dst_data17;  
output   [8-1:0] sc2mac_dat_dst_data18;  
output   [8-1:0] sc2mac_dat_dst_data19;  
output   [8-1:0] sc2mac_dat_dst_data20;  
output   [8-1:0] sc2mac_dat_dst_data21;  
output   [8-1:0] sc2mac_dat_dst_data22;  
output   [8-1:0] sc2mac_dat_dst_data23;  
output   [8-1:0] sc2mac_dat_dst_data24;  
output   [8-1:0] sc2mac_dat_dst_data25;  
output   [8-1:0] sc2mac_dat_dst_data26;  
output   [8-1:0] sc2mac_dat_dst_data27;  
output   [8-1:0] sc2mac_dat_dst_data28;  
output   [8-1:0] sc2mac_dat_dst_data29;  
output   [8-1:0] sc2mac_dat_dst_data30;  
output   [8-1:0] sc2mac_dat_dst_data31;  
output   [8-1:0] sc2mac_dat_dst_data32;  
output   [8-1:0] sc2mac_dat_dst_data33;  
output   [8-1:0] sc2mac_dat_dst_data34;  
output   [8-1:0] sc2mac_dat_dst_data35;  
output   [8-1:0] sc2mac_dat_dst_data36;  
output   [8-1:0] sc2mac_dat_dst_data37;  
output   [8-1:0] sc2mac_dat_dst_data38;  
output   [8-1:0] sc2mac_dat_dst_data39;  
output   [8-1:0] sc2mac_dat_dst_data40;  
output   [8-1:0] sc2mac_dat_dst_data41;  
output   [8-1:0] sc2mac_dat_dst_data42;  
output   [8-1:0] sc2mac_dat_dst_data43;  
output   [8-1:0] sc2mac_dat_dst_data44;  
output   [8-1:0] sc2mac_dat_dst_data45;  
output   [8-1:0] sc2mac_dat_dst_data46;  
output   [8-1:0] sc2mac_dat_dst_data47;  
output   [8-1:0] sc2mac_dat_dst_data48;  
output   [8-1:0] sc2mac_dat_dst_data49;  
output   [8-1:0] sc2mac_dat_dst_data50;  
output   [8-1:0] sc2mac_dat_dst_data51;  
output   [8-1:0] sc2mac_dat_dst_data52;  
output   [8-1:0] sc2mac_dat_dst_data53;  
output   [8-1:0] sc2mac_dat_dst_data54;  
output   [8-1:0] sc2mac_dat_dst_data55;  
output   [8-1:0] sc2mac_dat_dst_data56;  
output   [8-1:0] sc2mac_dat_dst_data57;  
output   [8-1:0] sc2mac_dat_dst_data58;  
output   [8-1:0] sc2mac_dat_dst_data59;  
output   [8-1:0] sc2mac_dat_dst_data60;  
output   [8-1:0] sc2mac_dat_dst_data61;  
output   [8-1:0] sc2mac_dat_dst_data62;  
output   [8-1:0] sc2mac_dat_dst_data63;  

//| eperl: generated_end (DO NOT EDIT ABOVE)
output [8:0] sc2mac_dat_dst_pd;
//: my $delay = 2;
//: my $i;
//: my $j;
//: my $k;
//: my $bb=8;
//: my $kk=32/2;
//: my $cc=64;
//: print "wire sc2mac_wt_pvld_d0 = sc2mac_wt_src_pvld;\n";
//: print "wire[${kk}-1:0] sc2mac_wt_sel_d0 = sc2mac_wt_src_sel;\n";
//: print "wire[${cc}-1:0] sc2mac_wt_mask_d0 = sc2mac_wt_src_mask;\n";
//: for($k = 0; $k <64; $k ++) {
//: print "wire sc2mac_wt_data${k}_d0 = sc2mac_wt_src_data${k};\n";
//: }
//:
//: print "wire sc2mac_dat_pvld_d0 = sc2mac_dat_src_pvld;\n";
//: print "wire[8:0] sc2mac_dat_pd_d0 = sc2mac_dat_src_pd;\n";
//: print "wire[${cc}-1:0] sc2mac_dat_mask_d0 = sc2mac_dat_src_mask;\n";
//: for($k = 0; $k <64; $k ++) {
//: print "wire[${bb}-1:0] sc2mac_dat_data${k}_d0 = sc2mac_dat_src_data${k};\n";
//: }
//:
//: for($i = 0; $i < $delay; $i ++) {
//: $j = $i + 1;
//: &eperl::flop("-q sc2mac_wt_pvld_d${j} -d sc2mac_wt_pvld_d${i}");
//: &eperl::flop("-wid ${kk} -q sc2mac_wt_sel_d${j}  -en \"(sc2mac_wt_pvld_d${i} | sc2mac_wt_pvld_d${j})\" -d sc2mac_wt_sel_d${i}");
//: &eperl::flop("-wid ${cc} -q sc2mac_wt_mask_d${j} -en \"(sc2mac_wt_pvld_d${i} | sc2mac_wt_pvld_d${j})\" -d sc2mac_wt_mask_d${i}");
//: for($k = 0; $k <64; $k ++) {
//: &eperl::flop("-wid ${bb} -q sc2mac_wt_data${k}_d${j} -en sc2mac_wt_mask_d${i}[${k}] -d sc2mac_wt_data${k}_d${i}");
//: }
//:
//: &eperl::flop("-q sc2mac_dat_pvld_d${j} -d sc2mac_dat_pvld_d${i}");
//: &eperl::flop("-wid 9 -q sc2mac_dat_pd_d${j} -en \"(sc2mac_dat_pvld_d${i} | sc2mac_dat_pvld_d${j})\" -d sc2mac_dat_pd_d${i}");
//: &eperl::flop("-wid ${cc} -q sc2mac_dat_mask_d${j} -en \"(sc2mac_dat_pvld_d${i} | sc2mac_dat_pvld_d${j})\" -d sc2mac_dat_mask_d${i}");
//: for($k = 0; $k <64; $k ++) {
//: &eperl::flop("-wid ${bb} -q sc2mac_dat_data${k}_d${j} -en \"(sc2mac_dat_mask_d${i}[${k}])\" -d sc2mac_dat_data${k}_d${i}");
//: }
//: }
//:
//: $i = $delay;
//: print "wire sc2mac_wt_dst_pvld = sc2mac_wt_pvld_d${i};\n";
//: print "wire[${kk}-1:0] sc2mac_wt_dst_sel = sc2mac_wt_sel_d${i};\n";
//: print "wire[${cc}-1:0] sc2mac_wt_dst_mask = sc2mac_wt_mask_d${i};\n";
//: for($k = 0; $k <64; $k ++) {
//: print "wire[${bb}-1:0] sc2mac_wt_dst_data${k} = sc2mac_wt_data${k}_d${i};\n";
//: }
//:
//: print "wire sc2mac_dat_dst_pvld = sc2mac_dat_pvld_d${i};\n";
//: print "wire[8:0] sc2mac_dat_dst_pd = sc2mac_dat_pd_d${i};\n";
//: print "wire[${cc}-1:0] sc2mac_dat_dst_mask = sc2mac_dat_mask_d${i};\n";
//: for($k = 0; $k <64; $k ++) {
//: print "wire[${bb}-1:0] sc2mac_dat_dst_data${k} = sc2mac_dat_data${k}_d${i};\n";
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
wire sc2mac_wt_pvld_d0 = sc2mac_wt_src_pvld;
wire[16-1:0] sc2mac_wt_sel_d0 = sc2mac_wt_src_sel;
wire[64-1:0] sc2mac_wt_mask_d0 = sc2mac_wt_src_mask;
wire sc2mac_wt_data0_d0 = sc2mac_wt_src_data0;
wire sc2mac_wt_data1_d0 = sc2mac_wt_src_data1;
wire sc2mac_wt_data2_d0 = sc2mac_wt_src_data2;
wire sc2mac_wt_data3_d0 = sc2mac_wt_src_data3;
wire sc2mac_wt_data4_d0 = sc2mac_wt_src_data4;
wire sc2mac_wt_data5_d0 = sc2mac_wt_src_data5;
wire sc2mac_wt_data6_d0 = sc2mac_wt_src_data6;
wire sc2mac_wt_data7_d0 = sc2mac_wt_src_data7;
wire sc2mac_wt_data8_d0 = sc2mac_wt_src_data8;
wire sc2mac_wt_data9_d0 = sc2mac_wt_src_data9;
wire sc2mac_wt_data10_d0 = sc2mac_wt_src_data10;
wire sc2mac_wt_data11_d0 = sc2mac_wt_src_data11;
wire sc2mac_wt_data12_d0 = sc2mac_wt_src_data12;
wire sc2mac_wt_data13_d0 = sc2mac_wt_src_data13;
wire sc2mac_wt_data14_d0 = sc2mac_wt_src_data14;
wire sc2mac_wt_data15_d0 = sc2mac_wt_src_data15;
wire sc2mac_wt_data16_d0 = sc2mac_wt_src_data16;
wire sc2mac_wt_data17_d0 = sc2mac_wt_src_data17;
wire sc2mac_wt_data18_d0 = sc2mac_wt_src_data18;
wire sc2mac_wt_data19_d0 = sc2mac_wt_src_data19;
wire sc2mac_wt_data20_d0 = sc2mac_wt_src_data20;
wire sc2mac_wt_data21_d0 = sc2mac_wt_src_data21;
wire sc2mac_wt_data22_d0 = sc2mac_wt_src_data22;
wire sc2mac_wt_data23_d0 = sc2mac_wt_src_data23;
wire sc2mac_wt_data24_d0 = sc2mac_wt_src_data24;
wire sc2mac_wt_data25_d0 = sc2mac_wt_src_data25;
wire sc2mac_wt_data26_d0 = sc2mac_wt_src_data26;
wire sc2mac_wt_data27_d0 = sc2mac_wt_src_data27;
wire sc2mac_wt_data28_d0 = sc2mac_wt_src_data28;
wire sc2mac_wt_data29_d0 = sc2mac_wt_src_data29;
wire sc2mac_wt_data30_d0 = sc2mac_wt_src_data30;
wire sc2mac_wt_data31_d0 = sc2mac_wt_src_data31;
wire sc2mac_wt_data32_d0 = sc2mac_wt_src_data32;
wire sc2mac_wt_data33_d0 = sc2mac_wt_src_data33;
wire sc2mac_wt_data34_d0 = sc2mac_wt_src_data34;
wire sc2mac_wt_data35_d0 = sc2mac_wt_src_data35;
wire sc2mac_wt_data36_d0 = sc2mac_wt_src_data36;
wire sc2mac_wt_data37_d0 = sc2mac_wt_src_data37;
wire sc2mac_wt_data38_d0 = sc2mac_wt_src_data38;
wire sc2mac_wt_data39_d0 = sc2mac_wt_src_data39;
wire sc2mac_wt_data40_d0 = sc2mac_wt_src_data40;
wire sc2mac_wt_data41_d0 = sc2mac_wt_src_data41;
wire sc2mac_wt_data42_d0 = sc2mac_wt_src_data42;
wire sc2mac_wt_data43_d0 = sc2mac_wt_src_data43;
wire sc2mac_wt_data44_d0 = sc2mac_wt_src_data44;
wire sc2mac_wt_data45_d0 = sc2mac_wt_src_data45;
wire sc2mac_wt_data46_d0 = sc2mac_wt_src_data46;
wire sc2mac_wt_data47_d0 = sc2mac_wt_src_data47;
wire sc2mac_wt_data48_d0 = sc2mac_wt_src_data48;
wire sc2mac_wt_data49_d0 = sc2mac_wt_src_data49;
wire sc2mac_wt_data50_d0 = sc2mac_wt_src_data50;
wire sc2mac_wt_data51_d0 = sc2mac_wt_src_data51;
wire sc2mac_wt_data52_d0 = sc2mac_wt_src_data52;
wire sc2mac_wt_data53_d0 = sc2mac_wt_src_data53;
wire sc2mac_wt_data54_d0 = sc2mac_wt_src_data54;
wire sc2mac_wt_data55_d0 = sc2mac_wt_src_data55;
wire sc2mac_wt_data56_d0 = sc2mac_wt_src_data56;
wire sc2mac_wt_data57_d0 = sc2mac_wt_src_data57;
wire sc2mac_wt_data58_d0 = sc2mac_wt_src_data58;
wire sc2mac_wt_data59_d0 = sc2mac_wt_src_data59;
wire sc2mac_wt_data60_d0 = sc2mac_wt_src_data60;
wire sc2mac_wt_data61_d0 = sc2mac_wt_src_data61;
wire sc2mac_wt_data62_d0 = sc2mac_wt_src_data62;
wire sc2mac_wt_data63_d0 = sc2mac_wt_src_data63;
wire sc2mac_dat_pvld_d0 = sc2mac_dat_src_pvld;
wire[8:0] sc2mac_dat_pd_d0 = sc2mac_dat_src_pd;
wire[64-1:0] sc2mac_dat_mask_d0 = sc2mac_dat_src_mask;
wire[8-1:0] sc2mac_dat_data0_d0 = sc2mac_dat_src_data0;
wire[8-1:0] sc2mac_dat_data1_d0 = sc2mac_dat_src_data1;
wire[8-1:0] sc2mac_dat_data2_d0 = sc2mac_dat_src_data2;
wire[8-1:0] sc2mac_dat_data3_d0 = sc2mac_dat_src_data3;
wire[8-1:0] sc2mac_dat_data4_d0 = sc2mac_dat_src_data4;
wire[8-1:0] sc2mac_dat_data5_d0 = sc2mac_dat_src_data5;
wire[8-1:0] sc2mac_dat_data6_d0 = sc2mac_dat_src_data6;
wire[8-1:0] sc2mac_dat_data7_d0 = sc2mac_dat_src_data7;
wire[8-1:0] sc2mac_dat_data8_d0 = sc2mac_dat_src_data8;
wire[8-1:0] sc2mac_dat_data9_d0 = sc2mac_dat_src_data9;
wire[8-1:0] sc2mac_dat_data10_d0 = sc2mac_dat_src_data10;
wire[8-1:0] sc2mac_dat_data11_d0 = sc2mac_dat_src_data11;
wire[8-1:0] sc2mac_dat_data12_d0 = sc2mac_dat_src_data12;
wire[8-1:0] sc2mac_dat_data13_d0 = sc2mac_dat_src_data13;
wire[8-1:0] sc2mac_dat_data14_d0 = sc2mac_dat_src_data14;
wire[8-1:0] sc2mac_dat_data15_d0 = sc2mac_dat_src_data15;
wire[8-1:0] sc2mac_dat_data16_d0 = sc2mac_dat_src_data16;
wire[8-1:0] sc2mac_dat_data17_d0 = sc2mac_dat_src_data17;
wire[8-1:0] sc2mac_dat_data18_d0 = sc2mac_dat_src_data18;
wire[8-1:0] sc2mac_dat_data19_d0 = sc2mac_dat_src_data19;
wire[8-1:0] sc2mac_dat_data20_d0 = sc2mac_dat_src_data20;
wire[8-1:0] sc2mac_dat_data21_d0 = sc2mac_dat_src_data21;
wire[8-1:0] sc2mac_dat_data22_d0 = sc2mac_dat_src_data22;
wire[8-1:0] sc2mac_dat_data23_d0 = sc2mac_dat_src_data23;
wire[8-1:0] sc2mac_dat_data24_d0 = sc2mac_dat_src_data24;
wire[8-1:0] sc2mac_dat_data25_d0 = sc2mac_dat_src_data25;
wire[8-1:0] sc2mac_dat_data26_d0 = sc2mac_dat_src_data26;
wire[8-1:0] sc2mac_dat_data27_d0 = sc2mac_dat_src_data27;
wire[8-1:0] sc2mac_dat_data28_d0 = sc2mac_dat_src_data28;
wire[8-1:0] sc2mac_dat_data29_d0 = sc2mac_dat_src_data29;
wire[8-1:0] sc2mac_dat_data30_d0 = sc2mac_dat_src_data30;
wire[8-1:0] sc2mac_dat_data31_d0 = sc2mac_dat_src_data31;
wire[8-1:0] sc2mac_dat_data32_d0 = sc2mac_dat_src_data32;
wire[8-1:0] sc2mac_dat_data33_d0 = sc2mac_dat_src_data33;
wire[8-1:0] sc2mac_dat_data34_d0 = sc2mac_dat_src_data34;
wire[8-1:0] sc2mac_dat_data35_d0 = sc2mac_dat_src_data35;
wire[8-1:0] sc2mac_dat_data36_d0 = sc2mac_dat_src_data36;
wire[8-1:0] sc2mac_dat_data37_d0 = sc2mac_dat_src_data37;
wire[8-1:0] sc2mac_dat_data38_d0 = sc2mac_dat_src_data38;
wire[8-1:0] sc2mac_dat_data39_d0 = sc2mac_dat_src_data39;
wire[8-1:0] sc2mac_dat_data40_d0 = sc2mac_dat_src_data40;
wire[8-1:0] sc2mac_dat_data41_d0 = sc2mac_dat_src_data41;
wire[8-1:0] sc2mac_dat_data42_d0 = sc2mac_dat_src_data42;
wire[8-1:0] sc2mac_dat_data43_d0 = sc2mac_dat_src_data43;
wire[8-1:0] sc2mac_dat_data44_d0 = sc2mac_dat_src_data44;
wire[8-1:0] sc2mac_dat_data45_d0 = sc2mac_dat_src_data45;
wire[8-1:0] sc2mac_dat_data46_d0 = sc2mac_dat_src_data46;
wire[8-1:0] sc2mac_dat_data47_d0 = sc2mac_dat_src_data47;
wire[8-1:0] sc2mac_dat_data48_d0 = sc2mac_dat_src_data48;
wire[8-1:0] sc2mac_dat_data49_d0 = sc2mac_dat_src_data49;
wire[8-1:0] sc2mac_dat_data50_d0 = sc2mac_dat_src_data50;
wire[8-1:0] sc2mac_dat_data51_d0 = sc2mac_dat_src_data51;
wire[8-1:0] sc2mac_dat_data52_d0 = sc2mac_dat_src_data52;
wire[8-1:0] sc2mac_dat_data53_d0 = sc2mac_dat_src_data53;
wire[8-1:0] sc2mac_dat_data54_d0 = sc2mac_dat_src_data54;
wire[8-1:0] sc2mac_dat_data55_d0 = sc2mac_dat_src_data55;
wire[8-1:0] sc2mac_dat_data56_d0 = sc2mac_dat_src_data56;
wire[8-1:0] sc2mac_dat_data57_d0 = sc2mac_dat_src_data57;
wire[8-1:0] sc2mac_dat_data58_d0 = sc2mac_dat_src_data58;
wire[8-1:0] sc2mac_dat_data59_d0 = sc2mac_dat_src_data59;
wire[8-1:0] sc2mac_dat_data60_d0 = sc2mac_dat_src_data60;
wire[8-1:0] sc2mac_dat_data61_d0 = sc2mac_dat_src_data61;
wire[8-1:0] sc2mac_dat_data62_d0 = sc2mac_dat_src_data62;
wire[8-1:0] sc2mac_dat_data63_d0 = sc2mac_dat_src_data63;
reg  sc2mac_wt_pvld_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_pvld_d1 <= 'b0;
   end else begin
       sc2mac_wt_pvld_d1 <= sc2mac_wt_pvld_d0;
   end
end
reg [15:0] sc2mac_wt_sel_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_sel_d1 <= 'b0;
   end else begin
       if (((sc2mac_wt_pvld_d0 | sc2mac_wt_pvld_d1)) == 1'b1) begin
           sc2mac_wt_sel_d1 <= sc2mac_wt_sel_d0;
       // VCS coverage off
       end else if (((sc2mac_wt_pvld_d0 | sc2mac_wt_pvld_d1)) == 1'b0) begin
       end else begin
           sc2mac_wt_sel_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [63:0] sc2mac_wt_mask_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_mask_d1 <= 'b0;
   end else begin
       if (((sc2mac_wt_pvld_d0 | sc2mac_wt_pvld_d1)) == 1'b1) begin
           sc2mac_wt_mask_d1 <= sc2mac_wt_mask_d0;
       // VCS coverage off
       end else if (((sc2mac_wt_pvld_d0 | sc2mac_wt_pvld_d1)) == 1'b0) begin
       end else begin
           sc2mac_wt_mask_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data0_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data0_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[0]) == 1'b1) begin
           sc2mac_wt_data0_d1 <= sc2mac_wt_data0_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[0]) == 1'b0) begin
       end else begin
           sc2mac_wt_data0_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data1_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data1_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[1]) == 1'b1) begin
           sc2mac_wt_data1_d1 <= sc2mac_wt_data1_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[1]) == 1'b0) begin
       end else begin
           sc2mac_wt_data1_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data2_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data2_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[2]) == 1'b1) begin
           sc2mac_wt_data2_d1 <= sc2mac_wt_data2_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[2]) == 1'b0) begin
       end else begin
           sc2mac_wt_data2_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data3_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data3_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[3]) == 1'b1) begin
           sc2mac_wt_data3_d1 <= sc2mac_wt_data3_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[3]) == 1'b0) begin
       end else begin
           sc2mac_wt_data3_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data4_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data4_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[4]) == 1'b1) begin
           sc2mac_wt_data4_d1 <= sc2mac_wt_data4_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[4]) == 1'b0) begin
       end else begin
           sc2mac_wt_data4_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data5_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data5_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[5]) == 1'b1) begin
           sc2mac_wt_data5_d1 <= sc2mac_wt_data5_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[5]) == 1'b0) begin
       end else begin
           sc2mac_wt_data5_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data6_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data6_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[6]) == 1'b1) begin
           sc2mac_wt_data6_d1 <= sc2mac_wt_data6_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[6]) == 1'b0) begin
       end else begin
           sc2mac_wt_data6_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data7_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data7_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[7]) == 1'b1) begin
           sc2mac_wt_data7_d1 <= sc2mac_wt_data7_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[7]) == 1'b0) begin
       end else begin
           sc2mac_wt_data7_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data8_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data8_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[8]) == 1'b1) begin
           sc2mac_wt_data8_d1 <= sc2mac_wt_data8_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[8]) == 1'b0) begin
       end else begin
           sc2mac_wt_data8_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data9_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data9_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[9]) == 1'b1) begin
           sc2mac_wt_data9_d1 <= sc2mac_wt_data9_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[9]) == 1'b0) begin
       end else begin
           sc2mac_wt_data9_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data10_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data10_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[10]) == 1'b1) begin
           sc2mac_wt_data10_d1 <= sc2mac_wt_data10_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[10]) == 1'b0) begin
       end else begin
           sc2mac_wt_data10_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data11_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data11_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[11]) == 1'b1) begin
           sc2mac_wt_data11_d1 <= sc2mac_wt_data11_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[11]) == 1'b0) begin
       end else begin
           sc2mac_wt_data11_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data12_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data12_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[12]) == 1'b1) begin
           sc2mac_wt_data12_d1 <= sc2mac_wt_data12_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[12]) == 1'b0) begin
       end else begin
           sc2mac_wt_data12_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data13_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data13_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[13]) == 1'b1) begin
           sc2mac_wt_data13_d1 <= sc2mac_wt_data13_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[13]) == 1'b0) begin
       end else begin
           sc2mac_wt_data13_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data14_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data14_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[14]) == 1'b1) begin
           sc2mac_wt_data14_d1 <= sc2mac_wt_data14_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[14]) == 1'b0) begin
       end else begin
           sc2mac_wt_data14_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data15_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data15_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[15]) == 1'b1) begin
           sc2mac_wt_data15_d1 <= sc2mac_wt_data15_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[15]) == 1'b0) begin
       end else begin
           sc2mac_wt_data15_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data16_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data16_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[16]) == 1'b1) begin
           sc2mac_wt_data16_d1 <= sc2mac_wt_data16_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[16]) == 1'b0) begin
       end else begin
           sc2mac_wt_data16_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data17_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data17_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[17]) == 1'b1) begin
           sc2mac_wt_data17_d1 <= sc2mac_wt_data17_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[17]) == 1'b0) begin
       end else begin
           sc2mac_wt_data17_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data18_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data18_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[18]) == 1'b1) begin
           sc2mac_wt_data18_d1 <= sc2mac_wt_data18_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[18]) == 1'b0) begin
       end else begin
           sc2mac_wt_data18_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data19_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data19_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[19]) == 1'b1) begin
           sc2mac_wt_data19_d1 <= sc2mac_wt_data19_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[19]) == 1'b0) begin
       end else begin
           sc2mac_wt_data19_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data20_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data20_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[20]) == 1'b1) begin
           sc2mac_wt_data20_d1 <= sc2mac_wt_data20_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[20]) == 1'b0) begin
       end else begin
           sc2mac_wt_data20_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data21_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data21_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[21]) == 1'b1) begin
           sc2mac_wt_data21_d1 <= sc2mac_wt_data21_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[21]) == 1'b0) begin
       end else begin
           sc2mac_wt_data21_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data22_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data22_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[22]) == 1'b1) begin
           sc2mac_wt_data22_d1 <= sc2mac_wt_data22_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[22]) == 1'b0) begin
       end else begin
           sc2mac_wt_data22_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data23_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data23_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[23]) == 1'b1) begin
           sc2mac_wt_data23_d1 <= sc2mac_wt_data23_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[23]) == 1'b0) begin
       end else begin
           sc2mac_wt_data23_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data24_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data24_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[24]) == 1'b1) begin
           sc2mac_wt_data24_d1 <= sc2mac_wt_data24_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[24]) == 1'b0) begin
       end else begin
           sc2mac_wt_data24_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data25_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data25_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[25]) == 1'b1) begin
           sc2mac_wt_data25_d1 <= sc2mac_wt_data25_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[25]) == 1'b0) begin
       end else begin
           sc2mac_wt_data25_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data26_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data26_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[26]) == 1'b1) begin
           sc2mac_wt_data26_d1 <= sc2mac_wt_data26_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[26]) == 1'b0) begin
       end else begin
           sc2mac_wt_data26_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data27_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data27_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[27]) == 1'b1) begin
           sc2mac_wt_data27_d1 <= sc2mac_wt_data27_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[27]) == 1'b0) begin
       end else begin
           sc2mac_wt_data27_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data28_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data28_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[28]) == 1'b1) begin
           sc2mac_wt_data28_d1 <= sc2mac_wt_data28_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[28]) == 1'b0) begin
       end else begin
           sc2mac_wt_data28_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data29_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data29_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[29]) == 1'b1) begin
           sc2mac_wt_data29_d1 <= sc2mac_wt_data29_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[29]) == 1'b0) begin
       end else begin
           sc2mac_wt_data29_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data30_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data30_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[30]) == 1'b1) begin
           sc2mac_wt_data30_d1 <= sc2mac_wt_data30_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[30]) == 1'b0) begin
       end else begin
           sc2mac_wt_data30_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data31_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data31_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[31]) == 1'b1) begin
           sc2mac_wt_data31_d1 <= sc2mac_wt_data31_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[31]) == 1'b0) begin
       end else begin
           sc2mac_wt_data31_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data32_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data32_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[32]) == 1'b1) begin
           sc2mac_wt_data32_d1 <= sc2mac_wt_data32_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[32]) == 1'b0) begin
       end else begin
           sc2mac_wt_data32_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data33_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data33_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[33]) == 1'b1) begin
           sc2mac_wt_data33_d1 <= sc2mac_wt_data33_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[33]) == 1'b0) begin
       end else begin
           sc2mac_wt_data33_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data34_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data34_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[34]) == 1'b1) begin
           sc2mac_wt_data34_d1 <= sc2mac_wt_data34_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[34]) == 1'b0) begin
       end else begin
           sc2mac_wt_data34_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data35_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data35_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[35]) == 1'b1) begin
           sc2mac_wt_data35_d1 <= sc2mac_wt_data35_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[35]) == 1'b0) begin
       end else begin
           sc2mac_wt_data35_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data36_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data36_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[36]) == 1'b1) begin
           sc2mac_wt_data36_d1 <= sc2mac_wt_data36_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[36]) == 1'b0) begin
       end else begin
           sc2mac_wt_data36_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data37_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data37_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[37]) == 1'b1) begin
           sc2mac_wt_data37_d1 <= sc2mac_wt_data37_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[37]) == 1'b0) begin
       end else begin
           sc2mac_wt_data37_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data38_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data38_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[38]) == 1'b1) begin
           sc2mac_wt_data38_d1 <= sc2mac_wt_data38_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[38]) == 1'b0) begin
       end else begin
           sc2mac_wt_data38_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data39_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data39_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[39]) == 1'b1) begin
           sc2mac_wt_data39_d1 <= sc2mac_wt_data39_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[39]) == 1'b0) begin
       end else begin
           sc2mac_wt_data39_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data40_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data40_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[40]) == 1'b1) begin
           sc2mac_wt_data40_d1 <= sc2mac_wt_data40_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[40]) == 1'b0) begin
       end else begin
           sc2mac_wt_data40_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data41_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data41_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[41]) == 1'b1) begin
           sc2mac_wt_data41_d1 <= sc2mac_wt_data41_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[41]) == 1'b0) begin
       end else begin
           sc2mac_wt_data41_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data42_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data42_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[42]) == 1'b1) begin
           sc2mac_wt_data42_d1 <= sc2mac_wt_data42_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[42]) == 1'b0) begin
       end else begin
           sc2mac_wt_data42_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data43_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data43_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[43]) == 1'b1) begin
           sc2mac_wt_data43_d1 <= sc2mac_wt_data43_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[43]) == 1'b0) begin
       end else begin
           sc2mac_wt_data43_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data44_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data44_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[44]) == 1'b1) begin
           sc2mac_wt_data44_d1 <= sc2mac_wt_data44_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[44]) == 1'b0) begin
       end else begin
           sc2mac_wt_data44_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data45_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data45_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[45]) == 1'b1) begin
           sc2mac_wt_data45_d1 <= sc2mac_wt_data45_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[45]) == 1'b0) begin
       end else begin
           sc2mac_wt_data45_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data46_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data46_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[46]) == 1'b1) begin
           sc2mac_wt_data46_d1 <= sc2mac_wt_data46_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[46]) == 1'b0) begin
       end else begin
           sc2mac_wt_data46_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data47_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data47_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[47]) == 1'b1) begin
           sc2mac_wt_data47_d1 <= sc2mac_wt_data47_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[47]) == 1'b0) begin
       end else begin
           sc2mac_wt_data47_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data48_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data48_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[48]) == 1'b1) begin
           sc2mac_wt_data48_d1 <= sc2mac_wt_data48_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[48]) == 1'b0) begin
       end else begin
           sc2mac_wt_data48_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data49_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data49_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[49]) == 1'b1) begin
           sc2mac_wt_data49_d1 <= sc2mac_wt_data49_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[49]) == 1'b0) begin
       end else begin
           sc2mac_wt_data49_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data50_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data50_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[50]) == 1'b1) begin
           sc2mac_wt_data50_d1 <= sc2mac_wt_data50_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[50]) == 1'b0) begin
       end else begin
           sc2mac_wt_data50_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data51_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data51_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[51]) == 1'b1) begin
           sc2mac_wt_data51_d1 <= sc2mac_wt_data51_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[51]) == 1'b0) begin
       end else begin
           sc2mac_wt_data51_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data52_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data52_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[52]) == 1'b1) begin
           sc2mac_wt_data52_d1 <= sc2mac_wt_data52_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[52]) == 1'b0) begin
       end else begin
           sc2mac_wt_data52_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data53_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data53_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[53]) == 1'b1) begin
           sc2mac_wt_data53_d1 <= sc2mac_wt_data53_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[53]) == 1'b0) begin
       end else begin
           sc2mac_wt_data53_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data54_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data54_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[54]) == 1'b1) begin
           sc2mac_wt_data54_d1 <= sc2mac_wt_data54_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[54]) == 1'b0) begin
       end else begin
           sc2mac_wt_data54_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data55_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data55_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[55]) == 1'b1) begin
           sc2mac_wt_data55_d1 <= sc2mac_wt_data55_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[55]) == 1'b0) begin
       end else begin
           sc2mac_wt_data55_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data56_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data56_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[56]) == 1'b1) begin
           sc2mac_wt_data56_d1 <= sc2mac_wt_data56_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[56]) == 1'b0) begin
       end else begin
           sc2mac_wt_data56_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data57_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data57_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[57]) == 1'b1) begin
           sc2mac_wt_data57_d1 <= sc2mac_wt_data57_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[57]) == 1'b0) begin
       end else begin
           sc2mac_wt_data57_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data58_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data58_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[58]) == 1'b1) begin
           sc2mac_wt_data58_d1 <= sc2mac_wt_data58_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[58]) == 1'b0) begin
       end else begin
           sc2mac_wt_data58_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data59_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data59_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[59]) == 1'b1) begin
           sc2mac_wt_data59_d1 <= sc2mac_wt_data59_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[59]) == 1'b0) begin
       end else begin
           sc2mac_wt_data59_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data60_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data60_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[60]) == 1'b1) begin
           sc2mac_wt_data60_d1 <= sc2mac_wt_data60_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[60]) == 1'b0) begin
       end else begin
           sc2mac_wt_data60_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data61_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data61_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[61]) == 1'b1) begin
           sc2mac_wt_data61_d1 <= sc2mac_wt_data61_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[61]) == 1'b0) begin
       end else begin
           sc2mac_wt_data61_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data62_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data62_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[62]) == 1'b1) begin
           sc2mac_wt_data62_d1 <= sc2mac_wt_data62_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[62]) == 1'b0) begin
       end else begin
           sc2mac_wt_data62_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data63_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data63_d1 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d0[63]) == 1'b1) begin
           sc2mac_wt_data63_d1 <= sc2mac_wt_data63_d0;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d0[63]) == 1'b0) begin
       end else begin
           sc2mac_wt_data63_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg  sc2mac_dat_pvld_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_pvld_d1 <= 'b0;
   end else begin
       sc2mac_dat_pvld_d1 <= sc2mac_dat_pvld_d0;
   end
end
reg [8:0] sc2mac_dat_pd_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_pd_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_pvld_d0 | sc2mac_dat_pvld_d1)) == 1'b1) begin
           sc2mac_dat_pd_d1 <= sc2mac_dat_pd_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_pvld_d0 | sc2mac_dat_pvld_d1)) == 1'b0) begin
       end else begin
           sc2mac_dat_pd_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [63:0] sc2mac_dat_mask_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_mask_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_pvld_d0 | sc2mac_dat_pvld_d1)) == 1'b1) begin
           sc2mac_dat_mask_d1 <= sc2mac_dat_mask_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_pvld_d0 | sc2mac_dat_pvld_d1)) == 1'b0) begin
       end else begin
           sc2mac_dat_mask_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data0_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data0_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[0])) == 1'b1) begin
           sc2mac_dat_data0_d1 <= sc2mac_dat_data0_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[0])) == 1'b0) begin
       end else begin
           sc2mac_dat_data0_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data1_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data1_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[1])) == 1'b1) begin
           sc2mac_dat_data1_d1 <= sc2mac_dat_data1_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[1])) == 1'b0) begin
       end else begin
           sc2mac_dat_data1_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data2_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data2_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[2])) == 1'b1) begin
           sc2mac_dat_data2_d1 <= sc2mac_dat_data2_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[2])) == 1'b0) begin
       end else begin
           sc2mac_dat_data2_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data3_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data3_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[3])) == 1'b1) begin
           sc2mac_dat_data3_d1 <= sc2mac_dat_data3_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[3])) == 1'b0) begin
       end else begin
           sc2mac_dat_data3_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data4_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data4_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[4])) == 1'b1) begin
           sc2mac_dat_data4_d1 <= sc2mac_dat_data4_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[4])) == 1'b0) begin
       end else begin
           sc2mac_dat_data4_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data5_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data5_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[5])) == 1'b1) begin
           sc2mac_dat_data5_d1 <= sc2mac_dat_data5_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[5])) == 1'b0) begin
       end else begin
           sc2mac_dat_data5_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data6_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data6_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[6])) == 1'b1) begin
           sc2mac_dat_data6_d1 <= sc2mac_dat_data6_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[6])) == 1'b0) begin
       end else begin
           sc2mac_dat_data6_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data7_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data7_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[7])) == 1'b1) begin
           sc2mac_dat_data7_d1 <= sc2mac_dat_data7_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[7])) == 1'b0) begin
       end else begin
           sc2mac_dat_data7_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data8_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data8_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[8])) == 1'b1) begin
           sc2mac_dat_data8_d1 <= sc2mac_dat_data8_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[8])) == 1'b0) begin
       end else begin
           sc2mac_dat_data8_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data9_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data9_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[9])) == 1'b1) begin
           sc2mac_dat_data9_d1 <= sc2mac_dat_data9_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[9])) == 1'b0) begin
       end else begin
           sc2mac_dat_data9_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data10_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data10_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[10])) == 1'b1) begin
           sc2mac_dat_data10_d1 <= sc2mac_dat_data10_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[10])) == 1'b0) begin
       end else begin
           sc2mac_dat_data10_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data11_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data11_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[11])) == 1'b1) begin
           sc2mac_dat_data11_d1 <= sc2mac_dat_data11_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[11])) == 1'b0) begin
       end else begin
           sc2mac_dat_data11_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data12_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data12_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[12])) == 1'b1) begin
           sc2mac_dat_data12_d1 <= sc2mac_dat_data12_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[12])) == 1'b0) begin
       end else begin
           sc2mac_dat_data12_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data13_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data13_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[13])) == 1'b1) begin
           sc2mac_dat_data13_d1 <= sc2mac_dat_data13_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[13])) == 1'b0) begin
       end else begin
           sc2mac_dat_data13_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data14_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data14_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[14])) == 1'b1) begin
           sc2mac_dat_data14_d1 <= sc2mac_dat_data14_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[14])) == 1'b0) begin
       end else begin
           sc2mac_dat_data14_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data15_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data15_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[15])) == 1'b1) begin
           sc2mac_dat_data15_d1 <= sc2mac_dat_data15_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[15])) == 1'b0) begin
       end else begin
           sc2mac_dat_data15_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data16_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data16_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[16])) == 1'b1) begin
           sc2mac_dat_data16_d1 <= sc2mac_dat_data16_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[16])) == 1'b0) begin
       end else begin
           sc2mac_dat_data16_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data17_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data17_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[17])) == 1'b1) begin
           sc2mac_dat_data17_d1 <= sc2mac_dat_data17_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[17])) == 1'b0) begin
       end else begin
           sc2mac_dat_data17_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data18_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data18_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[18])) == 1'b1) begin
           sc2mac_dat_data18_d1 <= sc2mac_dat_data18_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[18])) == 1'b0) begin
       end else begin
           sc2mac_dat_data18_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data19_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data19_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[19])) == 1'b1) begin
           sc2mac_dat_data19_d1 <= sc2mac_dat_data19_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[19])) == 1'b0) begin
       end else begin
           sc2mac_dat_data19_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data20_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data20_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[20])) == 1'b1) begin
           sc2mac_dat_data20_d1 <= sc2mac_dat_data20_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[20])) == 1'b0) begin
       end else begin
           sc2mac_dat_data20_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data21_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data21_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[21])) == 1'b1) begin
           sc2mac_dat_data21_d1 <= sc2mac_dat_data21_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[21])) == 1'b0) begin
       end else begin
           sc2mac_dat_data21_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data22_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data22_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[22])) == 1'b1) begin
           sc2mac_dat_data22_d1 <= sc2mac_dat_data22_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[22])) == 1'b0) begin
       end else begin
           sc2mac_dat_data22_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data23_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data23_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[23])) == 1'b1) begin
           sc2mac_dat_data23_d1 <= sc2mac_dat_data23_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[23])) == 1'b0) begin
       end else begin
           sc2mac_dat_data23_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data24_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data24_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[24])) == 1'b1) begin
           sc2mac_dat_data24_d1 <= sc2mac_dat_data24_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[24])) == 1'b0) begin
       end else begin
           sc2mac_dat_data24_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data25_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data25_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[25])) == 1'b1) begin
           sc2mac_dat_data25_d1 <= sc2mac_dat_data25_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[25])) == 1'b0) begin
       end else begin
           sc2mac_dat_data25_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data26_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data26_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[26])) == 1'b1) begin
           sc2mac_dat_data26_d1 <= sc2mac_dat_data26_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[26])) == 1'b0) begin
       end else begin
           sc2mac_dat_data26_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data27_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data27_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[27])) == 1'b1) begin
           sc2mac_dat_data27_d1 <= sc2mac_dat_data27_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[27])) == 1'b0) begin
       end else begin
           sc2mac_dat_data27_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data28_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data28_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[28])) == 1'b1) begin
           sc2mac_dat_data28_d1 <= sc2mac_dat_data28_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[28])) == 1'b0) begin
       end else begin
           sc2mac_dat_data28_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data29_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data29_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[29])) == 1'b1) begin
           sc2mac_dat_data29_d1 <= sc2mac_dat_data29_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[29])) == 1'b0) begin
       end else begin
           sc2mac_dat_data29_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data30_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data30_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[30])) == 1'b1) begin
           sc2mac_dat_data30_d1 <= sc2mac_dat_data30_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[30])) == 1'b0) begin
       end else begin
           sc2mac_dat_data30_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data31_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data31_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[31])) == 1'b1) begin
           sc2mac_dat_data31_d1 <= sc2mac_dat_data31_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[31])) == 1'b0) begin
       end else begin
           sc2mac_dat_data31_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data32_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data32_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[32])) == 1'b1) begin
           sc2mac_dat_data32_d1 <= sc2mac_dat_data32_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[32])) == 1'b0) begin
       end else begin
           sc2mac_dat_data32_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data33_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data33_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[33])) == 1'b1) begin
           sc2mac_dat_data33_d1 <= sc2mac_dat_data33_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[33])) == 1'b0) begin
       end else begin
           sc2mac_dat_data33_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data34_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data34_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[34])) == 1'b1) begin
           sc2mac_dat_data34_d1 <= sc2mac_dat_data34_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[34])) == 1'b0) begin
       end else begin
           sc2mac_dat_data34_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data35_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data35_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[35])) == 1'b1) begin
           sc2mac_dat_data35_d1 <= sc2mac_dat_data35_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[35])) == 1'b0) begin
       end else begin
           sc2mac_dat_data35_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data36_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data36_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[36])) == 1'b1) begin
           sc2mac_dat_data36_d1 <= sc2mac_dat_data36_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[36])) == 1'b0) begin
       end else begin
           sc2mac_dat_data36_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data37_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data37_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[37])) == 1'b1) begin
           sc2mac_dat_data37_d1 <= sc2mac_dat_data37_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[37])) == 1'b0) begin
       end else begin
           sc2mac_dat_data37_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data38_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data38_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[38])) == 1'b1) begin
           sc2mac_dat_data38_d1 <= sc2mac_dat_data38_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[38])) == 1'b0) begin
       end else begin
           sc2mac_dat_data38_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data39_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data39_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[39])) == 1'b1) begin
           sc2mac_dat_data39_d1 <= sc2mac_dat_data39_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[39])) == 1'b0) begin
       end else begin
           sc2mac_dat_data39_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data40_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data40_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[40])) == 1'b1) begin
           sc2mac_dat_data40_d1 <= sc2mac_dat_data40_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[40])) == 1'b0) begin
       end else begin
           sc2mac_dat_data40_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data41_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data41_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[41])) == 1'b1) begin
           sc2mac_dat_data41_d1 <= sc2mac_dat_data41_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[41])) == 1'b0) begin
       end else begin
           sc2mac_dat_data41_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data42_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data42_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[42])) == 1'b1) begin
           sc2mac_dat_data42_d1 <= sc2mac_dat_data42_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[42])) == 1'b0) begin
       end else begin
           sc2mac_dat_data42_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data43_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data43_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[43])) == 1'b1) begin
           sc2mac_dat_data43_d1 <= sc2mac_dat_data43_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[43])) == 1'b0) begin
       end else begin
           sc2mac_dat_data43_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data44_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data44_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[44])) == 1'b1) begin
           sc2mac_dat_data44_d1 <= sc2mac_dat_data44_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[44])) == 1'b0) begin
       end else begin
           sc2mac_dat_data44_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data45_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data45_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[45])) == 1'b1) begin
           sc2mac_dat_data45_d1 <= sc2mac_dat_data45_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[45])) == 1'b0) begin
       end else begin
           sc2mac_dat_data45_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data46_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data46_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[46])) == 1'b1) begin
           sc2mac_dat_data46_d1 <= sc2mac_dat_data46_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[46])) == 1'b0) begin
       end else begin
           sc2mac_dat_data46_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data47_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data47_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[47])) == 1'b1) begin
           sc2mac_dat_data47_d1 <= sc2mac_dat_data47_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[47])) == 1'b0) begin
       end else begin
           sc2mac_dat_data47_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data48_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data48_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[48])) == 1'b1) begin
           sc2mac_dat_data48_d1 <= sc2mac_dat_data48_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[48])) == 1'b0) begin
       end else begin
           sc2mac_dat_data48_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data49_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data49_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[49])) == 1'b1) begin
           sc2mac_dat_data49_d1 <= sc2mac_dat_data49_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[49])) == 1'b0) begin
       end else begin
           sc2mac_dat_data49_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data50_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data50_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[50])) == 1'b1) begin
           sc2mac_dat_data50_d1 <= sc2mac_dat_data50_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[50])) == 1'b0) begin
       end else begin
           sc2mac_dat_data50_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data51_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data51_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[51])) == 1'b1) begin
           sc2mac_dat_data51_d1 <= sc2mac_dat_data51_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[51])) == 1'b0) begin
       end else begin
           sc2mac_dat_data51_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data52_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data52_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[52])) == 1'b1) begin
           sc2mac_dat_data52_d1 <= sc2mac_dat_data52_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[52])) == 1'b0) begin
       end else begin
           sc2mac_dat_data52_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data53_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data53_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[53])) == 1'b1) begin
           sc2mac_dat_data53_d1 <= sc2mac_dat_data53_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[53])) == 1'b0) begin
       end else begin
           sc2mac_dat_data53_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data54_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data54_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[54])) == 1'b1) begin
           sc2mac_dat_data54_d1 <= sc2mac_dat_data54_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[54])) == 1'b0) begin
       end else begin
           sc2mac_dat_data54_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data55_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data55_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[55])) == 1'b1) begin
           sc2mac_dat_data55_d1 <= sc2mac_dat_data55_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[55])) == 1'b0) begin
       end else begin
           sc2mac_dat_data55_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data56_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data56_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[56])) == 1'b1) begin
           sc2mac_dat_data56_d1 <= sc2mac_dat_data56_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[56])) == 1'b0) begin
       end else begin
           sc2mac_dat_data56_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data57_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data57_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[57])) == 1'b1) begin
           sc2mac_dat_data57_d1 <= sc2mac_dat_data57_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[57])) == 1'b0) begin
       end else begin
           sc2mac_dat_data57_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data58_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data58_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[58])) == 1'b1) begin
           sc2mac_dat_data58_d1 <= sc2mac_dat_data58_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[58])) == 1'b0) begin
       end else begin
           sc2mac_dat_data58_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data59_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data59_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[59])) == 1'b1) begin
           sc2mac_dat_data59_d1 <= sc2mac_dat_data59_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[59])) == 1'b0) begin
       end else begin
           sc2mac_dat_data59_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data60_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data60_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[60])) == 1'b1) begin
           sc2mac_dat_data60_d1 <= sc2mac_dat_data60_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[60])) == 1'b0) begin
       end else begin
           sc2mac_dat_data60_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data61_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data61_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[61])) == 1'b1) begin
           sc2mac_dat_data61_d1 <= sc2mac_dat_data61_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[61])) == 1'b0) begin
       end else begin
           sc2mac_dat_data61_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data62_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data62_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[62])) == 1'b1) begin
           sc2mac_dat_data62_d1 <= sc2mac_dat_data62_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[62])) == 1'b0) begin
       end else begin
           sc2mac_dat_data62_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data63_d1;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data63_d1 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d0[63])) == 1'b1) begin
           sc2mac_dat_data63_d1 <= sc2mac_dat_data63_d0;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d0[63])) == 1'b0) begin
       end else begin
           sc2mac_dat_data63_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
reg  sc2mac_wt_pvld_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_pvld_d2 <= 'b0;
   end else begin
       sc2mac_wt_pvld_d2 <= sc2mac_wt_pvld_d1;
   end
end
reg [15:0] sc2mac_wt_sel_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_sel_d2 <= 'b0;
   end else begin
       if (((sc2mac_wt_pvld_d1 | sc2mac_wt_pvld_d2)) == 1'b1) begin
           sc2mac_wt_sel_d2 <= sc2mac_wt_sel_d1;
       // VCS coverage off
       end else if (((sc2mac_wt_pvld_d1 | sc2mac_wt_pvld_d2)) == 1'b0) begin
       end else begin
           sc2mac_wt_sel_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [63:0] sc2mac_wt_mask_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_mask_d2 <= 'b0;
   end else begin
       if (((sc2mac_wt_pvld_d1 | sc2mac_wt_pvld_d2)) == 1'b1) begin
           sc2mac_wt_mask_d2 <= sc2mac_wt_mask_d1;
       // VCS coverage off
       end else if (((sc2mac_wt_pvld_d1 | sc2mac_wt_pvld_d2)) == 1'b0) begin
       end else begin
           sc2mac_wt_mask_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data0_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data0_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[0]) == 1'b1) begin
           sc2mac_wt_data0_d2 <= sc2mac_wt_data0_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[0]) == 1'b0) begin
       end else begin
           sc2mac_wt_data0_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data1_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data1_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[1]) == 1'b1) begin
           sc2mac_wt_data1_d2 <= sc2mac_wt_data1_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[1]) == 1'b0) begin
       end else begin
           sc2mac_wt_data1_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data2_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data2_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[2]) == 1'b1) begin
           sc2mac_wt_data2_d2 <= sc2mac_wt_data2_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[2]) == 1'b0) begin
       end else begin
           sc2mac_wt_data2_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data3_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data3_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[3]) == 1'b1) begin
           sc2mac_wt_data3_d2 <= sc2mac_wt_data3_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[3]) == 1'b0) begin
       end else begin
           sc2mac_wt_data3_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data4_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data4_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[4]) == 1'b1) begin
           sc2mac_wt_data4_d2 <= sc2mac_wt_data4_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[4]) == 1'b0) begin
       end else begin
           sc2mac_wt_data4_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data5_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data5_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[5]) == 1'b1) begin
           sc2mac_wt_data5_d2 <= sc2mac_wt_data5_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[5]) == 1'b0) begin
       end else begin
           sc2mac_wt_data5_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data6_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data6_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[6]) == 1'b1) begin
           sc2mac_wt_data6_d2 <= sc2mac_wt_data6_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[6]) == 1'b0) begin
       end else begin
           sc2mac_wt_data6_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data7_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data7_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[7]) == 1'b1) begin
           sc2mac_wt_data7_d2 <= sc2mac_wt_data7_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[7]) == 1'b0) begin
       end else begin
           sc2mac_wt_data7_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data8_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data8_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[8]) == 1'b1) begin
           sc2mac_wt_data8_d2 <= sc2mac_wt_data8_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[8]) == 1'b0) begin
       end else begin
           sc2mac_wt_data8_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data9_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data9_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[9]) == 1'b1) begin
           sc2mac_wt_data9_d2 <= sc2mac_wt_data9_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[9]) == 1'b0) begin
       end else begin
           sc2mac_wt_data9_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data10_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data10_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[10]) == 1'b1) begin
           sc2mac_wt_data10_d2 <= sc2mac_wt_data10_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[10]) == 1'b0) begin
       end else begin
           sc2mac_wt_data10_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data11_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data11_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[11]) == 1'b1) begin
           sc2mac_wt_data11_d2 <= sc2mac_wt_data11_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[11]) == 1'b0) begin
       end else begin
           sc2mac_wt_data11_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data12_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data12_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[12]) == 1'b1) begin
           sc2mac_wt_data12_d2 <= sc2mac_wt_data12_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[12]) == 1'b0) begin
       end else begin
           sc2mac_wt_data12_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data13_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data13_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[13]) == 1'b1) begin
           sc2mac_wt_data13_d2 <= sc2mac_wt_data13_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[13]) == 1'b0) begin
       end else begin
           sc2mac_wt_data13_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data14_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data14_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[14]) == 1'b1) begin
           sc2mac_wt_data14_d2 <= sc2mac_wt_data14_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[14]) == 1'b0) begin
       end else begin
           sc2mac_wt_data14_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data15_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data15_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[15]) == 1'b1) begin
           sc2mac_wt_data15_d2 <= sc2mac_wt_data15_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[15]) == 1'b0) begin
       end else begin
           sc2mac_wt_data15_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data16_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data16_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[16]) == 1'b1) begin
           sc2mac_wt_data16_d2 <= sc2mac_wt_data16_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[16]) == 1'b0) begin
       end else begin
           sc2mac_wt_data16_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data17_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data17_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[17]) == 1'b1) begin
           sc2mac_wt_data17_d2 <= sc2mac_wt_data17_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[17]) == 1'b0) begin
       end else begin
           sc2mac_wt_data17_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data18_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data18_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[18]) == 1'b1) begin
           sc2mac_wt_data18_d2 <= sc2mac_wt_data18_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[18]) == 1'b0) begin
       end else begin
           sc2mac_wt_data18_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data19_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data19_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[19]) == 1'b1) begin
           sc2mac_wt_data19_d2 <= sc2mac_wt_data19_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[19]) == 1'b0) begin
       end else begin
           sc2mac_wt_data19_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data20_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data20_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[20]) == 1'b1) begin
           sc2mac_wt_data20_d2 <= sc2mac_wt_data20_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[20]) == 1'b0) begin
       end else begin
           sc2mac_wt_data20_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data21_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data21_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[21]) == 1'b1) begin
           sc2mac_wt_data21_d2 <= sc2mac_wt_data21_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[21]) == 1'b0) begin
       end else begin
           sc2mac_wt_data21_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data22_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data22_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[22]) == 1'b1) begin
           sc2mac_wt_data22_d2 <= sc2mac_wt_data22_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[22]) == 1'b0) begin
       end else begin
           sc2mac_wt_data22_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data23_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data23_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[23]) == 1'b1) begin
           sc2mac_wt_data23_d2 <= sc2mac_wt_data23_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[23]) == 1'b0) begin
       end else begin
           sc2mac_wt_data23_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data24_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data24_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[24]) == 1'b1) begin
           sc2mac_wt_data24_d2 <= sc2mac_wt_data24_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[24]) == 1'b0) begin
       end else begin
           sc2mac_wt_data24_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data25_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data25_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[25]) == 1'b1) begin
           sc2mac_wt_data25_d2 <= sc2mac_wt_data25_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[25]) == 1'b0) begin
       end else begin
           sc2mac_wt_data25_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data26_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data26_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[26]) == 1'b1) begin
           sc2mac_wt_data26_d2 <= sc2mac_wt_data26_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[26]) == 1'b0) begin
       end else begin
           sc2mac_wt_data26_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data27_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data27_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[27]) == 1'b1) begin
           sc2mac_wt_data27_d2 <= sc2mac_wt_data27_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[27]) == 1'b0) begin
       end else begin
           sc2mac_wt_data27_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data28_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data28_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[28]) == 1'b1) begin
           sc2mac_wt_data28_d2 <= sc2mac_wt_data28_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[28]) == 1'b0) begin
       end else begin
           sc2mac_wt_data28_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data29_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data29_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[29]) == 1'b1) begin
           sc2mac_wt_data29_d2 <= sc2mac_wt_data29_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[29]) == 1'b0) begin
       end else begin
           sc2mac_wt_data29_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data30_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data30_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[30]) == 1'b1) begin
           sc2mac_wt_data30_d2 <= sc2mac_wt_data30_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[30]) == 1'b0) begin
       end else begin
           sc2mac_wt_data30_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data31_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data31_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[31]) == 1'b1) begin
           sc2mac_wt_data31_d2 <= sc2mac_wt_data31_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[31]) == 1'b0) begin
       end else begin
           sc2mac_wt_data31_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data32_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data32_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[32]) == 1'b1) begin
           sc2mac_wt_data32_d2 <= sc2mac_wt_data32_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[32]) == 1'b0) begin
       end else begin
           sc2mac_wt_data32_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data33_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data33_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[33]) == 1'b1) begin
           sc2mac_wt_data33_d2 <= sc2mac_wt_data33_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[33]) == 1'b0) begin
       end else begin
           sc2mac_wt_data33_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data34_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data34_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[34]) == 1'b1) begin
           sc2mac_wt_data34_d2 <= sc2mac_wt_data34_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[34]) == 1'b0) begin
       end else begin
           sc2mac_wt_data34_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data35_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data35_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[35]) == 1'b1) begin
           sc2mac_wt_data35_d2 <= sc2mac_wt_data35_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[35]) == 1'b0) begin
       end else begin
           sc2mac_wt_data35_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data36_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data36_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[36]) == 1'b1) begin
           sc2mac_wt_data36_d2 <= sc2mac_wt_data36_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[36]) == 1'b0) begin
       end else begin
           sc2mac_wt_data36_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data37_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data37_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[37]) == 1'b1) begin
           sc2mac_wt_data37_d2 <= sc2mac_wt_data37_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[37]) == 1'b0) begin
       end else begin
           sc2mac_wt_data37_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data38_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data38_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[38]) == 1'b1) begin
           sc2mac_wt_data38_d2 <= sc2mac_wt_data38_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[38]) == 1'b0) begin
       end else begin
           sc2mac_wt_data38_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data39_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data39_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[39]) == 1'b1) begin
           sc2mac_wt_data39_d2 <= sc2mac_wt_data39_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[39]) == 1'b0) begin
       end else begin
           sc2mac_wt_data39_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data40_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data40_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[40]) == 1'b1) begin
           sc2mac_wt_data40_d2 <= sc2mac_wt_data40_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[40]) == 1'b0) begin
       end else begin
           sc2mac_wt_data40_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data41_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data41_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[41]) == 1'b1) begin
           sc2mac_wt_data41_d2 <= sc2mac_wt_data41_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[41]) == 1'b0) begin
       end else begin
           sc2mac_wt_data41_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data42_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data42_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[42]) == 1'b1) begin
           sc2mac_wt_data42_d2 <= sc2mac_wt_data42_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[42]) == 1'b0) begin
       end else begin
           sc2mac_wt_data42_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data43_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data43_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[43]) == 1'b1) begin
           sc2mac_wt_data43_d2 <= sc2mac_wt_data43_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[43]) == 1'b0) begin
       end else begin
           sc2mac_wt_data43_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data44_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data44_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[44]) == 1'b1) begin
           sc2mac_wt_data44_d2 <= sc2mac_wt_data44_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[44]) == 1'b0) begin
       end else begin
           sc2mac_wt_data44_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data45_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data45_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[45]) == 1'b1) begin
           sc2mac_wt_data45_d2 <= sc2mac_wt_data45_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[45]) == 1'b0) begin
       end else begin
           sc2mac_wt_data45_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data46_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data46_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[46]) == 1'b1) begin
           sc2mac_wt_data46_d2 <= sc2mac_wt_data46_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[46]) == 1'b0) begin
       end else begin
           sc2mac_wt_data46_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data47_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data47_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[47]) == 1'b1) begin
           sc2mac_wt_data47_d2 <= sc2mac_wt_data47_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[47]) == 1'b0) begin
       end else begin
           sc2mac_wt_data47_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data48_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data48_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[48]) == 1'b1) begin
           sc2mac_wt_data48_d2 <= sc2mac_wt_data48_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[48]) == 1'b0) begin
       end else begin
           sc2mac_wt_data48_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data49_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data49_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[49]) == 1'b1) begin
           sc2mac_wt_data49_d2 <= sc2mac_wt_data49_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[49]) == 1'b0) begin
       end else begin
           sc2mac_wt_data49_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data50_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data50_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[50]) == 1'b1) begin
           sc2mac_wt_data50_d2 <= sc2mac_wt_data50_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[50]) == 1'b0) begin
       end else begin
           sc2mac_wt_data50_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data51_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data51_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[51]) == 1'b1) begin
           sc2mac_wt_data51_d2 <= sc2mac_wt_data51_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[51]) == 1'b0) begin
       end else begin
           sc2mac_wt_data51_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data52_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data52_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[52]) == 1'b1) begin
           sc2mac_wt_data52_d2 <= sc2mac_wt_data52_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[52]) == 1'b0) begin
       end else begin
           sc2mac_wt_data52_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data53_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data53_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[53]) == 1'b1) begin
           sc2mac_wt_data53_d2 <= sc2mac_wt_data53_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[53]) == 1'b0) begin
       end else begin
           sc2mac_wt_data53_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data54_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data54_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[54]) == 1'b1) begin
           sc2mac_wt_data54_d2 <= sc2mac_wt_data54_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[54]) == 1'b0) begin
       end else begin
           sc2mac_wt_data54_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data55_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data55_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[55]) == 1'b1) begin
           sc2mac_wt_data55_d2 <= sc2mac_wt_data55_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[55]) == 1'b0) begin
       end else begin
           sc2mac_wt_data55_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data56_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data56_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[56]) == 1'b1) begin
           sc2mac_wt_data56_d2 <= sc2mac_wt_data56_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[56]) == 1'b0) begin
       end else begin
           sc2mac_wt_data56_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data57_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data57_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[57]) == 1'b1) begin
           sc2mac_wt_data57_d2 <= sc2mac_wt_data57_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[57]) == 1'b0) begin
       end else begin
           sc2mac_wt_data57_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data58_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data58_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[58]) == 1'b1) begin
           sc2mac_wt_data58_d2 <= sc2mac_wt_data58_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[58]) == 1'b0) begin
       end else begin
           sc2mac_wt_data58_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data59_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data59_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[59]) == 1'b1) begin
           sc2mac_wt_data59_d2 <= sc2mac_wt_data59_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[59]) == 1'b0) begin
       end else begin
           sc2mac_wt_data59_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data60_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data60_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[60]) == 1'b1) begin
           sc2mac_wt_data60_d2 <= sc2mac_wt_data60_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[60]) == 1'b0) begin
       end else begin
           sc2mac_wt_data60_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data61_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data61_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[61]) == 1'b1) begin
           sc2mac_wt_data61_d2 <= sc2mac_wt_data61_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[61]) == 1'b0) begin
       end else begin
           sc2mac_wt_data61_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data62_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data62_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[62]) == 1'b1) begin
           sc2mac_wt_data62_d2 <= sc2mac_wt_data62_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[62]) == 1'b0) begin
       end else begin
           sc2mac_wt_data62_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_wt_data63_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_wt_data63_d2 <= 'b0;
   end else begin
       if ((sc2mac_wt_mask_d1[63]) == 1'b1) begin
           sc2mac_wt_data63_d2 <= sc2mac_wt_data63_d1;
       // VCS coverage off
       end else if ((sc2mac_wt_mask_d1[63]) == 1'b0) begin
       end else begin
           sc2mac_wt_data63_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg  sc2mac_dat_pvld_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_pvld_d2 <= 'b0;
   end else begin
       sc2mac_dat_pvld_d2 <= sc2mac_dat_pvld_d1;
   end
end
reg [8:0] sc2mac_dat_pd_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_pd_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_pvld_d1 | sc2mac_dat_pvld_d2)) == 1'b1) begin
           sc2mac_dat_pd_d2 <= sc2mac_dat_pd_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_pvld_d1 | sc2mac_dat_pvld_d2)) == 1'b0) begin
       end else begin
           sc2mac_dat_pd_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [63:0] sc2mac_dat_mask_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_mask_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_pvld_d1 | sc2mac_dat_pvld_d2)) == 1'b1) begin
           sc2mac_dat_mask_d2 <= sc2mac_dat_mask_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_pvld_d1 | sc2mac_dat_pvld_d2)) == 1'b0) begin
       end else begin
           sc2mac_dat_mask_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data0_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data0_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[0])) == 1'b1) begin
           sc2mac_dat_data0_d2 <= sc2mac_dat_data0_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[0])) == 1'b0) begin
       end else begin
           sc2mac_dat_data0_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data1_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data1_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[1])) == 1'b1) begin
           sc2mac_dat_data1_d2 <= sc2mac_dat_data1_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[1])) == 1'b0) begin
       end else begin
           sc2mac_dat_data1_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data2_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data2_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[2])) == 1'b1) begin
           sc2mac_dat_data2_d2 <= sc2mac_dat_data2_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[2])) == 1'b0) begin
       end else begin
           sc2mac_dat_data2_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data3_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data3_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[3])) == 1'b1) begin
           sc2mac_dat_data3_d2 <= sc2mac_dat_data3_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[3])) == 1'b0) begin
       end else begin
           sc2mac_dat_data3_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data4_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data4_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[4])) == 1'b1) begin
           sc2mac_dat_data4_d2 <= sc2mac_dat_data4_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[4])) == 1'b0) begin
       end else begin
           sc2mac_dat_data4_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data5_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data5_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[5])) == 1'b1) begin
           sc2mac_dat_data5_d2 <= sc2mac_dat_data5_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[5])) == 1'b0) begin
       end else begin
           sc2mac_dat_data5_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data6_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data6_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[6])) == 1'b1) begin
           sc2mac_dat_data6_d2 <= sc2mac_dat_data6_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[6])) == 1'b0) begin
       end else begin
           sc2mac_dat_data6_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data7_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data7_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[7])) == 1'b1) begin
           sc2mac_dat_data7_d2 <= sc2mac_dat_data7_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[7])) == 1'b0) begin
       end else begin
           sc2mac_dat_data7_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data8_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data8_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[8])) == 1'b1) begin
           sc2mac_dat_data8_d2 <= sc2mac_dat_data8_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[8])) == 1'b0) begin
       end else begin
           sc2mac_dat_data8_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data9_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data9_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[9])) == 1'b1) begin
           sc2mac_dat_data9_d2 <= sc2mac_dat_data9_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[9])) == 1'b0) begin
       end else begin
           sc2mac_dat_data9_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data10_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data10_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[10])) == 1'b1) begin
           sc2mac_dat_data10_d2 <= sc2mac_dat_data10_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[10])) == 1'b0) begin
       end else begin
           sc2mac_dat_data10_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data11_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data11_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[11])) == 1'b1) begin
           sc2mac_dat_data11_d2 <= sc2mac_dat_data11_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[11])) == 1'b0) begin
       end else begin
           sc2mac_dat_data11_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data12_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data12_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[12])) == 1'b1) begin
           sc2mac_dat_data12_d2 <= sc2mac_dat_data12_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[12])) == 1'b0) begin
       end else begin
           sc2mac_dat_data12_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data13_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data13_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[13])) == 1'b1) begin
           sc2mac_dat_data13_d2 <= sc2mac_dat_data13_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[13])) == 1'b0) begin
       end else begin
           sc2mac_dat_data13_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data14_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data14_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[14])) == 1'b1) begin
           sc2mac_dat_data14_d2 <= sc2mac_dat_data14_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[14])) == 1'b0) begin
       end else begin
           sc2mac_dat_data14_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data15_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data15_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[15])) == 1'b1) begin
           sc2mac_dat_data15_d2 <= sc2mac_dat_data15_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[15])) == 1'b0) begin
       end else begin
           sc2mac_dat_data15_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data16_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data16_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[16])) == 1'b1) begin
           sc2mac_dat_data16_d2 <= sc2mac_dat_data16_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[16])) == 1'b0) begin
       end else begin
           sc2mac_dat_data16_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data17_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data17_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[17])) == 1'b1) begin
           sc2mac_dat_data17_d2 <= sc2mac_dat_data17_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[17])) == 1'b0) begin
       end else begin
           sc2mac_dat_data17_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data18_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data18_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[18])) == 1'b1) begin
           sc2mac_dat_data18_d2 <= sc2mac_dat_data18_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[18])) == 1'b0) begin
       end else begin
           sc2mac_dat_data18_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data19_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data19_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[19])) == 1'b1) begin
           sc2mac_dat_data19_d2 <= sc2mac_dat_data19_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[19])) == 1'b0) begin
       end else begin
           sc2mac_dat_data19_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data20_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data20_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[20])) == 1'b1) begin
           sc2mac_dat_data20_d2 <= sc2mac_dat_data20_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[20])) == 1'b0) begin
       end else begin
           sc2mac_dat_data20_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data21_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data21_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[21])) == 1'b1) begin
           sc2mac_dat_data21_d2 <= sc2mac_dat_data21_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[21])) == 1'b0) begin
       end else begin
           sc2mac_dat_data21_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data22_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data22_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[22])) == 1'b1) begin
           sc2mac_dat_data22_d2 <= sc2mac_dat_data22_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[22])) == 1'b0) begin
       end else begin
           sc2mac_dat_data22_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data23_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data23_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[23])) == 1'b1) begin
           sc2mac_dat_data23_d2 <= sc2mac_dat_data23_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[23])) == 1'b0) begin
       end else begin
           sc2mac_dat_data23_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data24_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data24_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[24])) == 1'b1) begin
           sc2mac_dat_data24_d2 <= sc2mac_dat_data24_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[24])) == 1'b0) begin
       end else begin
           sc2mac_dat_data24_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data25_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data25_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[25])) == 1'b1) begin
           sc2mac_dat_data25_d2 <= sc2mac_dat_data25_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[25])) == 1'b0) begin
       end else begin
           sc2mac_dat_data25_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data26_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data26_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[26])) == 1'b1) begin
           sc2mac_dat_data26_d2 <= sc2mac_dat_data26_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[26])) == 1'b0) begin
       end else begin
           sc2mac_dat_data26_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data27_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data27_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[27])) == 1'b1) begin
           sc2mac_dat_data27_d2 <= sc2mac_dat_data27_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[27])) == 1'b0) begin
       end else begin
           sc2mac_dat_data27_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data28_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data28_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[28])) == 1'b1) begin
           sc2mac_dat_data28_d2 <= sc2mac_dat_data28_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[28])) == 1'b0) begin
       end else begin
           sc2mac_dat_data28_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data29_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data29_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[29])) == 1'b1) begin
           sc2mac_dat_data29_d2 <= sc2mac_dat_data29_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[29])) == 1'b0) begin
       end else begin
           sc2mac_dat_data29_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data30_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data30_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[30])) == 1'b1) begin
           sc2mac_dat_data30_d2 <= sc2mac_dat_data30_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[30])) == 1'b0) begin
       end else begin
           sc2mac_dat_data30_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data31_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data31_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[31])) == 1'b1) begin
           sc2mac_dat_data31_d2 <= sc2mac_dat_data31_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[31])) == 1'b0) begin
       end else begin
           sc2mac_dat_data31_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data32_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data32_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[32])) == 1'b1) begin
           sc2mac_dat_data32_d2 <= sc2mac_dat_data32_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[32])) == 1'b0) begin
       end else begin
           sc2mac_dat_data32_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data33_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data33_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[33])) == 1'b1) begin
           sc2mac_dat_data33_d2 <= sc2mac_dat_data33_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[33])) == 1'b0) begin
       end else begin
           sc2mac_dat_data33_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data34_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data34_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[34])) == 1'b1) begin
           sc2mac_dat_data34_d2 <= sc2mac_dat_data34_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[34])) == 1'b0) begin
       end else begin
           sc2mac_dat_data34_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data35_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data35_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[35])) == 1'b1) begin
           sc2mac_dat_data35_d2 <= sc2mac_dat_data35_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[35])) == 1'b0) begin
       end else begin
           sc2mac_dat_data35_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data36_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data36_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[36])) == 1'b1) begin
           sc2mac_dat_data36_d2 <= sc2mac_dat_data36_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[36])) == 1'b0) begin
       end else begin
           sc2mac_dat_data36_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data37_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data37_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[37])) == 1'b1) begin
           sc2mac_dat_data37_d2 <= sc2mac_dat_data37_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[37])) == 1'b0) begin
       end else begin
           sc2mac_dat_data37_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data38_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data38_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[38])) == 1'b1) begin
           sc2mac_dat_data38_d2 <= sc2mac_dat_data38_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[38])) == 1'b0) begin
       end else begin
           sc2mac_dat_data38_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data39_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data39_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[39])) == 1'b1) begin
           sc2mac_dat_data39_d2 <= sc2mac_dat_data39_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[39])) == 1'b0) begin
       end else begin
           sc2mac_dat_data39_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data40_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data40_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[40])) == 1'b1) begin
           sc2mac_dat_data40_d2 <= sc2mac_dat_data40_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[40])) == 1'b0) begin
       end else begin
           sc2mac_dat_data40_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data41_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data41_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[41])) == 1'b1) begin
           sc2mac_dat_data41_d2 <= sc2mac_dat_data41_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[41])) == 1'b0) begin
       end else begin
           sc2mac_dat_data41_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data42_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data42_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[42])) == 1'b1) begin
           sc2mac_dat_data42_d2 <= sc2mac_dat_data42_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[42])) == 1'b0) begin
       end else begin
           sc2mac_dat_data42_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data43_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data43_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[43])) == 1'b1) begin
           sc2mac_dat_data43_d2 <= sc2mac_dat_data43_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[43])) == 1'b0) begin
       end else begin
           sc2mac_dat_data43_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data44_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data44_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[44])) == 1'b1) begin
           sc2mac_dat_data44_d2 <= sc2mac_dat_data44_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[44])) == 1'b0) begin
       end else begin
           sc2mac_dat_data44_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data45_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data45_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[45])) == 1'b1) begin
           sc2mac_dat_data45_d2 <= sc2mac_dat_data45_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[45])) == 1'b0) begin
       end else begin
           sc2mac_dat_data45_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data46_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data46_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[46])) == 1'b1) begin
           sc2mac_dat_data46_d2 <= sc2mac_dat_data46_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[46])) == 1'b0) begin
       end else begin
           sc2mac_dat_data46_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data47_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data47_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[47])) == 1'b1) begin
           sc2mac_dat_data47_d2 <= sc2mac_dat_data47_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[47])) == 1'b0) begin
       end else begin
           sc2mac_dat_data47_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data48_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data48_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[48])) == 1'b1) begin
           sc2mac_dat_data48_d2 <= sc2mac_dat_data48_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[48])) == 1'b0) begin
       end else begin
           sc2mac_dat_data48_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data49_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data49_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[49])) == 1'b1) begin
           sc2mac_dat_data49_d2 <= sc2mac_dat_data49_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[49])) == 1'b0) begin
       end else begin
           sc2mac_dat_data49_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data50_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data50_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[50])) == 1'b1) begin
           sc2mac_dat_data50_d2 <= sc2mac_dat_data50_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[50])) == 1'b0) begin
       end else begin
           sc2mac_dat_data50_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data51_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data51_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[51])) == 1'b1) begin
           sc2mac_dat_data51_d2 <= sc2mac_dat_data51_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[51])) == 1'b0) begin
       end else begin
           sc2mac_dat_data51_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data52_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data52_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[52])) == 1'b1) begin
           sc2mac_dat_data52_d2 <= sc2mac_dat_data52_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[52])) == 1'b0) begin
       end else begin
           sc2mac_dat_data52_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data53_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data53_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[53])) == 1'b1) begin
           sc2mac_dat_data53_d2 <= sc2mac_dat_data53_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[53])) == 1'b0) begin
       end else begin
           sc2mac_dat_data53_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data54_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data54_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[54])) == 1'b1) begin
           sc2mac_dat_data54_d2 <= sc2mac_dat_data54_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[54])) == 1'b0) begin
       end else begin
           sc2mac_dat_data54_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data55_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data55_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[55])) == 1'b1) begin
           sc2mac_dat_data55_d2 <= sc2mac_dat_data55_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[55])) == 1'b0) begin
       end else begin
           sc2mac_dat_data55_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data56_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data56_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[56])) == 1'b1) begin
           sc2mac_dat_data56_d2 <= sc2mac_dat_data56_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[56])) == 1'b0) begin
       end else begin
           sc2mac_dat_data56_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data57_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data57_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[57])) == 1'b1) begin
           sc2mac_dat_data57_d2 <= sc2mac_dat_data57_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[57])) == 1'b0) begin
       end else begin
           sc2mac_dat_data57_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data58_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data58_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[58])) == 1'b1) begin
           sc2mac_dat_data58_d2 <= sc2mac_dat_data58_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[58])) == 1'b0) begin
       end else begin
           sc2mac_dat_data58_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data59_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data59_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[59])) == 1'b1) begin
           sc2mac_dat_data59_d2 <= sc2mac_dat_data59_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[59])) == 1'b0) begin
       end else begin
           sc2mac_dat_data59_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data60_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data60_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[60])) == 1'b1) begin
           sc2mac_dat_data60_d2 <= sc2mac_dat_data60_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[60])) == 1'b0) begin
       end else begin
           sc2mac_dat_data60_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data61_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data61_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[61])) == 1'b1) begin
           sc2mac_dat_data61_d2 <= sc2mac_dat_data61_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[61])) == 1'b0) begin
       end else begin
           sc2mac_dat_data61_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data62_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data62_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[62])) == 1'b1) begin
           sc2mac_dat_data62_d2 <= sc2mac_dat_data62_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[62])) == 1'b0) begin
       end else begin
           sc2mac_dat_data62_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
reg [7:0] sc2mac_dat_data63_d2;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sc2mac_dat_data63_d2 <= 'b0;
   end else begin
       if (((sc2mac_dat_mask_d1[63])) == 1'b1) begin
           sc2mac_dat_data63_d2 <= sc2mac_dat_data63_d1;
       // VCS coverage off
       end else if (((sc2mac_dat_mask_d1[63])) == 1'b0) begin
       end else begin
           sc2mac_dat_data63_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
wire sc2mac_wt_dst_pvld = sc2mac_wt_pvld_d2;
wire[16-1:0] sc2mac_wt_dst_sel = sc2mac_wt_sel_d2;
wire[64-1:0] sc2mac_wt_dst_mask = sc2mac_wt_mask_d2;
wire[8-1:0] sc2mac_wt_dst_data0 = sc2mac_wt_data0_d2;
wire[8-1:0] sc2mac_wt_dst_data1 = sc2mac_wt_data1_d2;
wire[8-1:0] sc2mac_wt_dst_data2 = sc2mac_wt_data2_d2;
wire[8-1:0] sc2mac_wt_dst_data3 = sc2mac_wt_data3_d2;
wire[8-1:0] sc2mac_wt_dst_data4 = sc2mac_wt_data4_d2;
wire[8-1:0] sc2mac_wt_dst_data5 = sc2mac_wt_data5_d2;
wire[8-1:0] sc2mac_wt_dst_data6 = sc2mac_wt_data6_d2;
wire[8-1:0] sc2mac_wt_dst_data7 = sc2mac_wt_data7_d2;
wire[8-1:0] sc2mac_wt_dst_data8 = sc2mac_wt_data8_d2;
wire[8-1:0] sc2mac_wt_dst_data9 = sc2mac_wt_data9_d2;
wire[8-1:0] sc2mac_wt_dst_data10 = sc2mac_wt_data10_d2;
wire[8-1:0] sc2mac_wt_dst_data11 = sc2mac_wt_data11_d2;
wire[8-1:0] sc2mac_wt_dst_data12 = sc2mac_wt_data12_d2;
wire[8-1:0] sc2mac_wt_dst_data13 = sc2mac_wt_data13_d2;
wire[8-1:0] sc2mac_wt_dst_data14 = sc2mac_wt_data14_d2;
wire[8-1:0] sc2mac_wt_dst_data15 = sc2mac_wt_data15_d2;
wire[8-1:0] sc2mac_wt_dst_data16 = sc2mac_wt_data16_d2;
wire[8-1:0] sc2mac_wt_dst_data17 = sc2mac_wt_data17_d2;
wire[8-1:0] sc2mac_wt_dst_data18 = sc2mac_wt_data18_d2;
wire[8-1:0] sc2mac_wt_dst_data19 = sc2mac_wt_data19_d2;
wire[8-1:0] sc2mac_wt_dst_data20 = sc2mac_wt_data20_d2;
wire[8-1:0] sc2mac_wt_dst_data21 = sc2mac_wt_data21_d2;
wire[8-1:0] sc2mac_wt_dst_data22 = sc2mac_wt_data22_d2;
wire[8-1:0] sc2mac_wt_dst_data23 = sc2mac_wt_data23_d2;
wire[8-1:0] sc2mac_wt_dst_data24 = sc2mac_wt_data24_d2;
wire[8-1:0] sc2mac_wt_dst_data25 = sc2mac_wt_data25_d2;
wire[8-1:0] sc2mac_wt_dst_data26 = sc2mac_wt_data26_d2;
wire[8-1:0] sc2mac_wt_dst_data27 = sc2mac_wt_data27_d2;
wire[8-1:0] sc2mac_wt_dst_data28 = sc2mac_wt_data28_d2;
wire[8-1:0] sc2mac_wt_dst_data29 = sc2mac_wt_data29_d2;
wire[8-1:0] sc2mac_wt_dst_data30 = sc2mac_wt_data30_d2;
wire[8-1:0] sc2mac_wt_dst_data31 = sc2mac_wt_data31_d2;
wire[8-1:0] sc2mac_wt_dst_data32 = sc2mac_wt_data32_d2;
wire[8-1:0] sc2mac_wt_dst_data33 = sc2mac_wt_data33_d2;
wire[8-1:0] sc2mac_wt_dst_data34 = sc2mac_wt_data34_d2;
wire[8-1:0] sc2mac_wt_dst_data35 = sc2mac_wt_data35_d2;
wire[8-1:0] sc2mac_wt_dst_data36 = sc2mac_wt_data36_d2;
wire[8-1:0] sc2mac_wt_dst_data37 = sc2mac_wt_data37_d2;
wire[8-1:0] sc2mac_wt_dst_data38 = sc2mac_wt_data38_d2;
wire[8-1:0] sc2mac_wt_dst_data39 = sc2mac_wt_data39_d2;
wire[8-1:0] sc2mac_wt_dst_data40 = sc2mac_wt_data40_d2;
wire[8-1:0] sc2mac_wt_dst_data41 = sc2mac_wt_data41_d2;
wire[8-1:0] sc2mac_wt_dst_data42 = sc2mac_wt_data42_d2;
wire[8-1:0] sc2mac_wt_dst_data43 = sc2mac_wt_data43_d2;
wire[8-1:0] sc2mac_wt_dst_data44 = sc2mac_wt_data44_d2;
wire[8-1:0] sc2mac_wt_dst_data45 = sc2mac_wt_data45_d2;
wire[8-1:0] sc2mac_wt_dst_data46 = sc2mac_wt_data46_d2;
wire[8-1:0] sc2mac_wt_dst_data47 = sc2mac_wt_data47_d2;
wire[8-1:0] sc2mac_wt_dst_data48 = sc2mac_wt_data48_d2;
wire[8-1:0] sc2mac_wt_dst_data49 = sc2mac_wt_data49_d2;
wire[8-1:0] sc2mac_wt_dst_data50 = sc2mac_wt_data50_d2;
wire[8-1:0] sc2mac_wt_dst_data51 = sc2mac_wt_data51_d2;
wire[8-1:0] sc2mac_wt_dst_data52 = sc2mac_wt_data52_d2;
wire[8-1:0] sc2mac_wt_dst_data53 = sc2mac_wt_data53_d2;
wire[8-1:0] sc2mac_wt_dst_data54 = sc2mac_wt_data54_d2;
wire[8-1:0] sc2mac_wt_dst_data55 = sc2mac_wt_data55_d2;
wire[8-1:0] sc2mac_wt_dst_data56 = sc2mac_wt_data56_d2;
wire[8-1:0] sc2mac_wt_dst_data57 = sc2mac_wt_data57_d2;
wire[8-1:0] sc2mac_wt_dst_data58 = sc2mac_wt_data58_d2;
wire[8-1:0] sc2mac_wt_dst_data59 = sc2mac_wt_data59_d2;
wire[8-1:0] sc2mac_wt_dst_data60 = sc2mac_wt_data60_d2;
wire[8-1:0] sc2mac_wt_dst_data61 = sc2mac_wt_data61_d2;
wire[8-1:0] sc2mac_wt_dst_data62 = sc2mac_wt_data62_d2;
wire[8-1:0] sc2mac_wt_dst_data63 = sc2mac_wt_data63_d2;
wire sc2mac_dat_dst_pvld = sc2mac_dat_pvld_d2;
wire[8:0] sc2mac_dat_dst_pd = sc2mac_dat_pd_d2;
wire[64-1:0] sc2mac_dat_dst_mask = sc2mac_dat_mask_d2;
wire[8-1:0] sc2mac_dat_dst_data0 = sc2mac_dat_data0_d2;
wire[8-1:0] sc2mac_dat_dst_data1 = sc2mac_dat_data1_d2;
wire[8-1:0] sc2mac_dat_dst_data2 = sc2mac_dat_data2_d2;
wire[8-1:0] sc2mac_dat_dst_data3 = sc2mac_dat_data3_d2;
wire[8-1:0] sc2mac_dat_dst_data4 = sc2mac_dat_data4_d2;
wire[8-1:0] sc2mac_dat_dst_data5 = sc2mac_dat_data5_d2;
wire[8-1:0] sc2mac_dat_dst_data6 = sc2mac_dat_data6_d2;
wire[8-1:0] sc2mac_dat_dst_data7 = sc2mac_dat_data7_d2;
wire[8-1:0] sc2mac_dat_dst_data8 = sc2mac_dat_data8_d2;
wire[8-1:0] sc2mac_dat_dst_data9 = sc2mac_dat_data9_d2;
wire[8-1:0] sc2mac_dat_dst_data10 = sc2mac_dat_data10_d2;
wire[8-1:0] sc2mac_dat_dst_data11 = sc2mac_dat_data11_d2;
wire[8-1:0] sc2mac_dat_dst_data12 = sc2mac_dat_data12_d2;
wire[8-1:0] sc2mac_dat_dst_data13 = sc2mac_dat_data13_d2;
wire[8-1:0] sc2mac_dat_dst_data14 = sc2mac_dat_data14_d2;
wire[8-1:0] sc2mac_dat_dst_data15 = sc2mac_dat_data15_d2;
wire[8-1:0] sc2mac_dat_dst_data16 = sc2mac_dat_data16_d2;
wire[8-1:0] sc2mac_dat_dst_data17 = sc2mac_dat_data17_d2;
wire[8-1:0] sc2mac_dat_dst_data18 = sc2mac_dat_data18_d2;
wire[8-1:0] sc2mac_dat_dst_data19 = sc2mac_dat_data19_d2;
wire[8-1:0] sc2mac_dat_dst_data20 = sc2mac_dat_data20_d2;
wire[8-1:0] sc2mac_dat_dst_data21 = sc2mac_dat_data21_d2;
wire[8-1:0] sc2mac_dat_dst_data22 = sc2mac_dat_data22_d2;
wire[8-1:0] sc2mac_dat_dst_data23 = sc2mac_dat_data23_d2;
wire[8-1:0] sc2mac_dat_dst_data24 = sc2mac_dat_data24_d2;
wire[8-1:0] sc2mac_dat_dst_data25 = sc2mac_dat_data25_d2;
wire[8-1:0] sc2mac_dat_dst_data26 = sc2mac_dat_data26_d2;
wire[8-1:0] sc2mac_dat_dst_data27 = sc2mac_dat_data27_d2;
wire[8-1:0] sc2mac_dat_dst_data28 = sc2mac_dat_data28_d2;
wire[8-1:0] sc2mac_dat_dst_data29 = sc2mac_dat_data29_d2;
wire[8-1:0] sc2mac_dat_dst_data30 = sc2mac_dat_data30_d2;
wire[8-1:0] sc2mac_dat_dst_data31 = sc2mac_dat_data31_d2;
wire[8-1:0] sc2mac_dat_dst_data32 = sc2mac_dat_data32_d2;
wire[8-1:0] sc2mac_dat_dst_data33 = sc2mac_dat_data33_d2;
wire[8-1:0] sc2mac_dat_dst_data34 = sc2mac_dat_data34_d2;
wire[8-1:0] sc2mac_dat_dst_data35 = sc2mac_dat_data35_d2;
wire[8-1:0] sc2mac_dat_dst_data36 = sc2mac_dat_data36_d2;
wire[8-1:0] sc2mac_dat_dst_data37 = sc2mac_dat_data37_d2;
wire[8-1:0] sc2mac_dat_dst_data38 = sc2mac_dat_data38_d2;
wire[8-1:0] sc2mac_dat_dst_data39 = sc2mac_dat_data39_d2;
wire[8-1:0] sc2mac_dat_dst_data40 = sc2mac_dat_data40_d2;
wire[8-1:0] sc2mac_dat_dst_data41 = sc2mac_dat_data41_d2;
wire[8-1:0] sc2mac_dat_dst_data42 = sc2mac_dat_data42_d2;
wire[8-1:0] sc2mac_dat_dst_data43 = sc2mac_dat_data43_d2;
wire[8-1:0] sc2mac_dat_dst_data44 = sc2mac_dat_data44_d2;
wire[8-1:0] sc2mac_dat_dst_data45 = sc2mac_dat_data45_d2;
wire[8-1:0] sc2mac_dat_dst_data46 = sc2mac_dat_data46_d2;
wire[8-1:0] sc2mac_dat_dst_data47 = sc2mac_dat_data47_d2;
wire[8-1:0] sc2mac_dat_dst_data48 = sc2mac_dat_data48_d2;
wire[8-1:0] sc2mac_dat_dst_data49 = sc2mac_dat_data49_d2;
wire[8-1:0] sc2mac_dat_dst_data50 = sc2mac_dat_data50_d2;
wire[8-1:0] sc2mac_dat_dst_data51 = sc2mac_dat_data51_d2;
wire[8-1:0] sc2mac_dat_dst_data52 = sc2mac_dat_data52_d2;
wire[8-1:0] sc2mac_dat_dst_data53 = sc2mac_dat_data53_d2;
wire[8-1:0] sc2mac_dat_dst_data54 = sc2mac_dat_data54_d2;
wire[8-1:0] sc2mac_dat_dst_data55 = sc2mac_dat_data55_d2;
wire[8-1:0] sc2mac_dat_dst_data56 = sc2mac_dat_data56_d2;
wire[8-1:0] sc2mac_dat_dst_data57 = sc2mac_dat_data57_d2;
wire[8-1:0] sc2mac_dat_dst_data58 = sc2mac_dat_data58_d2;
wire[8-1:0] sc2mac_dat_dst_data59 = sc2mac_dat_data59_d2;
wire[8-1:0] sc2mac_dat_dst_data60 = sc2mac_dat_data60_d2;
wire[8-1:0] sc2mac_dat_dst_data61 = sc2mac_dat_data61_d2;
wire[8-1:0] sc2mac_dat_dst_data62 = sc2mac_dat_data62_d2;
wire[8-1:0] sc2mac_dat_dst_data63 = sc2mac_dat_data63_d2;

//| eperl: generated_end (DO NOT EDIT ABOVE)
endmodule // NV_NVDLA_RT_csc2cmac_a
