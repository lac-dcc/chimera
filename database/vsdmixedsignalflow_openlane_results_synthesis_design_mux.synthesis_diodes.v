module design_mux (CSB,
    RST,
    SCK,
    SDI,
    out,
    select,
    trap,
    VPWR,
    VGND,
    mask_rev_in);
 input CSB;
 input RST;
 input SCK;
 input SDI;
 output out;
 input select;
 input trap;
 input VPWR;
 input VGND;
 input [3:0] mask_rev_in;

 AMUX2_3V AMUX2_3V (.select(select),
    .out(out),
    .I1(\raven_spi.reset ));
 sky130_fd_sc_hd__inv_8 _139_ (.A(SCK),
    .Y(_039_));
 sky130_fd_sc_hd__inv_8 _140_ (.A(CSB),
    .Y(_125_));
 sky130_fd_sc_hd__buf_1 _141_ (.A(_125_),
    .X(_038_));
 sky130_fd_sc_hd__buf_1 _142_ (.A(_038_),
    .X(_037_));
 sky130_fd_sc_hd__buf_1 _143_ (.A(_038_),
    .X(_036_));
 sky130_fd_sc_hd__buf_1 _144_ (.A(_038_),
    .X(_035_));
 sky130_fd_sc_hd__buf_1 _145_ (.A(_038_),
    .X(_034_));
 sky130_fd_sc_hd__buf_1 _146_ (.A(_125_),
    .X(_126_));
 sky130_fd_sc_hd__buf_1 _147_ (.A(_126_),
    .X(_127_));
 sky130_fd_sc_hd__buf_1 _148_ (.A(_127_),
    .X(_033_));
 sky130_fd_sc_hd__buf_1 _149_ (.A(_127_),
    .X(_032_));
 sky130_fd_sc_hd__buf_1 _150_ (.A(_127_),
    .X(_031_));
 sky130_fd_sc_hd__buf_1 _151_ (.A(_127_),
    .X(_030_));
 sky130_fd_sc_hd__buf_1 _152_ (.A(_127_),
    .X(_029_));
 sky130_fd_sc_hd__buf_1 _153_ (.A(_125_),
    .X(_128_));
 sky130_fd_sc_hd__buf_1 _154_ (.A(_128_),
    .X(_028_));
 sky130_fd_sc_hd__buf_1 _155_ (.A(_128_),
    .X(_027_));
 sky130_fd_sc_hd__buf_1 _156_ (.A(_128_),
    .X(_026_));
 sky130_fd_sc_hd__buf_1 _157_ (.A(_128_),
    .X(_025_));
 sky130_fd_sc_hd__buf_1 _158_ (.A(_128_),
    .X(_024_));
 sky130_fd_sc_hd__buf_1 _159_ (.A(_126_),
    .X(_023_));
 sky130_fd_sc_hd__buf_1 _160_ (.A(_126_),
    .X(_022_));
 sky130_fd_sc_hd__buf_1 _161_ (.A(_126_),
    .X(_021_));
 sky130_fd_sc_hd__buf_1 _162_ (.A(_126_),
    .X(_020_));
 sky130_fd_sc_hd__buf_1 _163_ (.A(\raven_spi.U1.state[0] ),
    .X(_129_));
 sky130_fd_sc_hd__buf_1 _164_ (.A(_129_),
    .X(_130_));
 sky130_fd_sc_hd__inv_8 _165_ (.A(\raven_spi.U1.count[2] ),
    .Y(_131_));
 sky130_fd_sc_hd__inv_8 _166_ (.A(\raven_spi.U1.count[0] ),
    .Y(_132_));
 sky130_fd_sc_hd__inv_8 _167_ (.A(\raven_spi.U1.count[1] ),
    .Y(_133_));
 sky130_fd_sc_hd__and2_4 _168_ (.A(_132_),
    .B(_133_),
    .X(_134_));
 sky130_fd_sc_hd__o22a_4 _169_ (.A1(_131_),
    .A2(_134_),
    .B1(\raven_spi.U1.count[1] ),
    .B2(\raven_spi.U1.count[2] ),
    .X(_135_));
 sky130_fd_sc_hd__or2_4 _170_ (.A(\raven_spi.U1.fixed[1] ),
    .B(_135_),
    .X(_136_));
 sky130_fd_sc_hd__inv_8 _171_ (.A(_135_),
    .Y(_137_));
 sky130_fd_sc_hd__or2_4 _172_ (.A(\raven_spi.U1.fixed[0] ),
    .B(_137_),
    .X(_138_));
 sky130_fd_sc_hd__inv_8 _173_ (.A(\raven_spi.U1.state[0] ),
    .Y(_041_));
 sky130_fd_sc_hd__buf_1 _174_ (.A(_041_),
    .X(_042_));
 sky130_fd_sc_hd__buf_1 _175_ (.A(_042_),
    .X(_043_));
 sky130_fd_sc_hd__inv_8 _176_ (.A(\raven_spi.U1.fixed[1] ),
    .Y(_044_));
 sky130_fd_sc_hd__inv_8 _177_ (.A(\raven_spi.U1.fixed[0] ),
    .Y(_045_));
 sky130_fd_sc_hd__or3_4 _178_ (.A(_132_),
    .B(_133_),
    .C(_131_),
    .X(_046_));
 sky130_fd_sc_hd__inv_8 _179_ (.A(_046_),
    .Y(_047_));
 sky130_fd_sc_hd__and2_4 _180_ (.A(\raven_spi.U1.state[1] ),
    .B(_047_),
    .X(_048_));
 sky130_fd_sc_hd__buf_1 _181_ (.A(_048_),
    .X(_049_));
 sky130_fd_sc_hd__inv_8 _182_ (.A(_049_),
    .Y(_050_));
 sky130_fd_sc_hd__or2_4 _183_ (.A(\raven_spi.U1.state[2] ),
    .B(_050_),
    .X(_051_));
 sky130_fd_sc_hd__buf_1 _184_ (.A(_051_),
    .X(_052_));
 sky130_fd_sc_hd__inv_8 _185_ (.A(_052_),
    .Y(_053_));
 sky130_fd_sc_hd__and2_4 _186_ (.A(_045_),
    .B(_053_),
    .X(_054_));
 sky130_fd_sc_hd__and2_4 _187_ (.A(_044_),
    .B(_054_),
    .X(_055_));
 sky130_fd_sc_hd__buf_1 _188_ (.A(_055_),
    .X(_056_));
 sky130_fd_sc_hd__a2bb2o_4 _189_ (.A1_N(_044_),
    .A2_N(_054_),
    .B1(\raven_spi.U1.fixed[2] ),
    .B2(_056_),
    .X(_057_));
 sky130_fd_sc_hd__a32o_4 _190_ (.A1(_130_),
    .A2(_136_),
    .A3(_138_),
    .B1(_043_),
    .B2(_057_),
    .X(_016_));
 sky130_fd_sc_hd__inv_8 _191_ (.A(_056_),
    .Y(_058_));
 sky130_fd_sc_hd__or2_4 _192_ (.A(\raven_spi.U1.fixed[1] ),
    .B(_137_),
    .X(_059_));
 sky130_fd_sc_hd__o21a_4 _193_ (.A1(\raven_spi.U1.fixed[2] ),
    .A2(_135_),
    .B1(_129_),
    .X(_060_));
 sky130_fd_sc_hd__a32o_4 _194_ (.A1(_043_),
    .A2(\raven_spi.U1.fixed[2] ),
    .A3(_058_),
    .B1(_059_),
    .B2(_060_),
    .X(_017_));
 sky130_fd_sc_hd__or4_4 _195_ (.A(\raven_spi.U1.count[0] ),
    .B(\raven_spi.U1.count[1] ),
    .C(_041_),
    .D(\raven_spi.U1.count[2] ),
    .X(_061_));
 sky130_fd_sc_hd__and4_4 _196_ (.A(_129_),
    .B(_131_),
    .C(_134_),
    .D(SDI),
    .X(_062_));
 sky130_fd_sc_hd__a21o_4 _197_ (.A1(\raven_spi.U1.writemode ),
    .A2(_061_),
    .B1(_062_),
    .X(_018_));
 sky130_fd_sc_hd__buf_1 _198_ (.A(\raven_spi.U1.state[2] ),
    .X(_063_));
 sky130_fd_sc_hd__or3_4 _199_ (.A(\raven_spi.U1.state[0] ),
    .B(\raven_spi.U1.state[1] ),
    .C(_063_),
    .X(_064_));
 sky130_fd_sc_hd__inv_8 _200_ (.A(_064_),
    .Y(_065_));
 sky130_fd_sc_hd__and2_4 _201_ (.A(\raven_spi.U1.count[0] ),
    .B(_064_),
    .X(_066_));
 sky130_fd_sc_hd__a21oi_4 _202_ (.A1(_132_),
    .A2(_065_),
    .B1(_066_),
    .Y(_012_));
 sky130_fd_sc_hd__or3_4 _203_ (.A(_132_),
    .B(_133_),
    .C(_065_),
    .X(_067_));
 sky130_fd_sc_hd__o21a_4 _204_ (.A1(\raven_spi.U1.count[1] ),
    .A2(_066_),
    .B1(_067_),
    .X(_013_));
 sky130_fd_sc_hd__or2_4 _205_ (.A(\raven_spi.U1.count[2] ),
    .B(_067_),
    .X(_068_));
 sky130_fd_sc_hd__a21bo_4 _206_ (.A1(\raven_spi.U1.count[2] ),
    .A2(_067_),
    .B1_N(_068_),
    .X(_014_));
 sky130_fd_sc_hd__inv_8 _207_ (.A(\raven_spi.U1.addr[0] ),
    .Y(_069_));
 sky130_fd_sc_hd__or3_4 _208_ (.A(\raven_spi.U1.fixed[1] ),
    .B(_045_),
    .C(\raven_spi.U1.fixed[2] ),
    .X(_070_));
 sky130_fd_sc_hd__inv_8 _209_ (.A(_070_),
    .Y(_071_));
 sky130_fd_sc_hd__inv_8 _210_ (.A(\raven_spi.U1.state[2] ),
    .Y(_072_));
 sky130_fd_sc_hd__buf_1 _211_ (.A(_072_),
    .X(_073_));
 sky130_fd_sc_hd__o32a_4 _212_ (.A1(_069_),
    .A2(_071_),
    .A3(_052_),
    .B1(_073_),
    .B2(SDI),
    .X(_074_));
 sky130_fd_sc_hd__and2_4 _213_ (.A(_049_),
    .B(_070_),
    .X(_075_));
 sky130_fd_sc_hd__o21a_4 _214_ (.A1(_063_),
    .A2(_075_),
    .B1(_041_),
    .X(_076_));
 sky130_fd_sc_hd__o22a_4 _215_ (.A1(_130_),
    .A2(_074_),
    .B1(\raven_spi.U1.addr[0] ),
    .B2(_076_),
    .X(_004_));
 sky130_fd_sc_hd__and2_4 _216_ (.A(\raven_spi.U1.addr[0] ),
    .B(_076_),
    .X(_077_));
 sky130_fd_sc_hd__buf_1 _217_ (.A(_073_),
    .X(_078_));
 sky130_fd_sc_hd__inv_8 _218_ (.A(\raven_spi.U1.addr[1] ),
    .Y(_079_));
 sky130_fd_sc_hd__or4_4 _219_ (.A(_069_),
    .B(_079_),
    .C(_071_),
    .D(_050_),
    .X(_080_));
 sky130_fd_sc_hd__a21o_4 _220_ (.A1(_078_),
    .A2(_080_),
    .B1(_130_),
    .X(_081_));
 sky130_fd_sc_hd__buf_1 _221_ (.A(_063_),
    .X(_082_));
 sky130_fd_sc_hd__and2_4 _222_ (.A(_082_),
    .B(\raven_spi.U1.addr[0] ),
    .X(_083_));
 sky130_fd_sc_hd__o22a_4 _223_ (.A1(\raven_spi.U1.addr[1] ),
    .A2(_077_),
    .B1(_081_),
    .B2(_083_),
    .X(_005_));
 sky130_fd_sc_hd__buf_1 _224_ (.A(_130_),
    .X(_084_));
 sky130_fd_sc_hd__or4_4 _225_ (.A(_069_),
    .B(_079_),
    .C(_071_),
    .D(\raven_spi.U1.addr[2] ),
    .X(_085_));
 sky130_fd_sc_hd__o22a_4 _226_ (.A1(_073_),
    .A2(_079_),
    .B1(_052_),
    .B2(_085_),
    .X(_086_));
 sky130_fd_sc_hd__a2bb2o_4 _227_ (.A1_N(_084_),
    .A2_N(_086_),
    .B1(\raven_spi.U1.addr[2] ),
    .B2(_081_),
    .X(_006_));
 sky130_fd_sc_hd__inv_8 _228_ (.A(\raven_spi.U1.addr[3] ),
    .Y(_087_));
 sky130_fd_sc_hd__inv_8 _229_ (.A(\raven_spi.U1.addr[2] ),
    .Y(_088_));
 sky130_fd_sc_hd__o22a_4 _230_ (.A1(_063_),
    .A2(_087_),
    .B1(_088_),
    .B2(_080_),
    .X(_089_));
 sky130_fd_sc_hd__or3_4 _231_ (.A(_088_),
    .B(_087_),
    .C(_080_),
    .X(_090_));
 sky130_fd_sc_hd__buf_1 _232_ (.A(_090_),
    .X(_091_));
 sky130_fd_sc_hd__inv_8 _233_ (.A(_091_),
    .Y(_092_));
 sky130_fd_sc_hd__o22a_4 _234_ (.A1(_089_),
    .A2(_092_),
    .B1(_078_),
    .B2(_088_),
    .X(_093_));
 sky130_fd_sc_hd__a2bb2o_4 _235_ (.A1_N(_084_),
    .A2_N(_093_),
    .B1(_084_),
    .B2(\raven_spi.U1.addr[3] ),
    .X(_007_));
 sky130_fd_sc_hd__inv_8 _236_ (.A(\raven_spi.U1.addr[4] ),
    .Y(_094_));
 sky130_fd_sc_hd__or2_4 _237_ (.A(_094_),
    .B(_091_),
    .X(_095_));
 sky130_fd_sc_hd__and2_4 _238_ (.A(_073_),
    .B(_095_),
    .X(_096_));
 sky130_fd_sc_hd__inv_8 _239_ (.A(_096_),
    .Y(_097_));
 sky130_fd_sc_hd__and2_4 _240_ (.A(_094_),
    .B(_091_),
    .X(_098_));
 sky130_fd_sc_hd__o22a_4 _241_ (.A1(_078_),
    .A2(_087_),
    .B1(_097_),
    .B2(_098_),
    .X(_099_));
 sky130_fd_sc_hd__or2_4 _242_ (.A(_042_),
    .B(_094_),
    .X(_100_));
 sky130_fd_sc_hd__o21ai_4 _243_ (.A1(_084_),
    .A2(_099_),
    .B1(_100_),
    .Y(_008_));
 sky130_fd_sc_hd__inv_8 _244_ (.A(\raven_spi.U1.addr[5] ),
    .Y(_101_));
 sky130_fd_sc_hd__a21o_4 _245_ (.A1(_101_),
    .A2(_092_),
    .B1(_082_),
    .X(_102_));
 sky130_fd_sc_hd__or2_4 _246_ (.A(_129_),
    .B(_096_),
    .X(_103_));
 sky130_fd_sc_hd__a32o_4 _247_ (.A1(_043_),
    .A2(\raven_spi.U1.addr[4] ),
    .A3(_102_),
    .B1(\raven_spi.U1.addr[5] ),
    .B2(_103_),
    .X(_009_));
 sky130_fd_sc_hd__o21ai_4 _248_ (.A1(\raven_spi.U1.addr[6] ),
    .A2(_095_),
    .B1(_078_),
    .Y(_104_));
 sky130_fd_sc_hd__and3_4 _249_ (.A(\raven_spi.U1.addr[4] ),
    .B(_092_),
    .C(\raven_spi.U1.addr[5] ),
    .X(_105_));
 sky130_fd_sc_hd__o21ai_4 _250_ (.A1(_082_),
    .A2(_105_),
    .B1(_042_),
    .Y(_106_));
 sky130_fd_sc_hd__a32o_4 _251_ (.A1(_043_),
    .A2(\raven_spi.U1.addr[5] ),
    .A3(_104_),
    .B1(\raven_spi.U1.addr[6] ),
    .B2(_106_),
    .X(_010_));
 sky130_fd_sc_hd__a21o_4 _252_ (.A1(_072_),
    .A2(\raven_spi.U1.addr[7] ),
    .B1(\raven_spi.U1.addr[6] ),
    .X(_107_));
 sky130_fd_sc_hd__or3_4 _253_ (.A(_094_),
    .B(_101_),
    .C(_091_),
    .X(_108_));
 sky130_fd_sc_hd__a21boi_4 _254_ (.A1(\raven_spi.U1.addr[6] ),
    .A2(\raven_spi.U1.addr[7] ),
    .B1_N(_105_),
    .Y(_109_));
 sky130_fd_sc_hd__a211o_4 _255_ (.A1(\raven_spi.U1.addr[7] ),
    .A2(_108_),
    .B1(_082_),
    .C1(_109_),
    .X(_110_));
 sky130_fd_sc_hd__a32o_4 _256_ (.A1(_042_),
    .A2(_107_),
    .A3(_110_),
    .B1(_130_),
    .B2(\raven_spi.U1.addr[7] ),
    .X(_011_));
 sky130_fd_sc_hd__a211o_4 _257_ (.A1(\raven_spi.U1.addr[2] ),
    .A2(\raven_spi.U1.addr[3] ),
    .B1(_069_),
    .C1(_079_),
    .X(_111_));
 sky130_fd_sc_hd__a2bb2o_4 _258_ (.A1_N(_072_),
    .A2_N(_088_),
    .B1(_063_),
    .B2(\raven_spi.U1.addr[3] ),
    .X(_112_));
 sky130_fd_sc_hd__inv_8 _259_ (.A(SDI),
    .Y(_113_));
 sky130_fd_sc_hd__o21a_4 _260_ (.A1(_073_),
    .A2(_113_),
    .B1(_088_),
    .X(_114_));
 sky130_fd_sc_hd__inv_8 _261_ (.A(\raven_spi.U1.wrstb ),
    .Y(_115_));
 sky130_fd_sc_hd__or4_4 _262_ (.A(\raven_spi.U1.addr[4] ),
    .B(\raven_spi.U1.addr[5] ),
    .C(_115_),
    .D(_107_),
    .X(_116_));
 sky130_fd_sc_hd__or4_4 _263_ (.A(_111_),
    .B(_112_),
    .C(_114_),
    .D(_116_),
    .X(_117_));
 sky130_fd_sc_hd__nor2_4 _264_ (.A(_113_),
    .B(_117_),
    .Y(_118_));
 sky130_fd_sc_hd__a21o_4 _265_ (.A1(\raven_spi.reset ),
    .A2(_117_),
    .B1(_118_),
    .X(_003_));
 sky130_fd_sc_hd__o21a_4 _266_ (.A1(\raven_spi.U1.writemode ),
    .A2(\raven_spi.U1.wrstb ),
    .B1(_049_),
    .X(_019_));
 sky130_fd_sc_hd__a2bb2o_4 _267_ (.A1_N(_078_),
    .A2_N(_047_),
    .B1(_084_),
    .B2(_047_),
    .X(_002_));
 sky130_fd_sc_hd__a2bb2o_4 _268_ (.A1_N(_043_),
    .A2_N(_047_),
    .B1(_049_),
    .B2(_071_),
    .X(_000_));
 sky130_fd_sc_hd__and2_4 _269_ (.A(\raven_spi.U1.state[1] ),
    .B(_046_),
    .X(_119_));
 sky130_fd_sc_hd__a211o_4 _270_ (.A1(_082_),
    .A2(_047_),
    .B1(_119_),
    .C1(_075_),
    .X(_001_));
 sky130_fd_sc_hd__o21a_4 _271_ (.A1(\raven_spi.U1.fixed[1] ),
    .A2(\raven_spi.U1.fixed[2] ),
    .B1(_053_),
    .X(_120_));
 sky130_fd_sc_hd__or2_4 _272_ (.A(\raven_spi.U1.fixed[0] ),
    .B(_120_),
    .X(_121_));
 sky130_fd_sc_hd__nand2_4 _273_ (.A(\raven_spi.U1.fixed[0] ),
    .B(_120_),
    .Y(_122_));
 sky130_fd_sc_hd__or2_4 _274_ (.A(SDI),
    .B(_137_),
    .X(_123_));
 sky130_fd_sc_hd__o21a_4 _275_ (.A1(\raven_spi.U1.fixed[0] ),
    .A2(_135_),
    .B1(_129_),
    .X(_124_));
 sky130_fd_sc_hd__a32o_4 _276_ (.A1(_042_),
    .A2(_121_),
    .A3(_122_),
    .B1(_123_),
    .B2(_124_),
    .X(_015_));
 sky130_fd_sc_hd__inv_8 _277_ (.A(RST),
    .Y(_040_));
 sky130_fd_sc_hd__dfstp_4 _278_ (.D(_000_),
    .Q(\raven_spi.U1.state[0] ),
    .SET_B(_020_),
    .CLK(SCK));
 sky130_fd_sc_hd__dfrtp_4 _279_ (.D(_001_),
    .Q(\raven_spi.U1.state[1] ),
    .RESET_B(_021_),
    .CLK(SCK));
 sky130_fd_sc_hd__dfrtp_4 _280_ (.D(_002_),
    .Q(\raven_spi.U1.state[2] ),
    .RESET_B(_022_),
    .CLK(SCK));
 sky130_fd_sc_hd__dfrtp_4 _281_ (.D(_004_),
    .Q(\raven_spi.U1.addr[0] ),
    .RESET_B(_023_),
    .CLK(SCK));
 sky130_fd_sc_hd__dfrtp_4 _282_ (.D(_005_),
    .Q(\raven_spi.U1.addr[1] ),
    .RESET_B(_024_),
    .CLK(SCK));
 sky130_fd_sc_hd__dfrtp_4 _283_ (.D(_006_),
    .Q(\raven_spi.U1.addr[2] ),
    .RESET_B(_025_),
    .CLK(SCK));
 sky130_fd_sc_hd__dfrtp_4 _284_ (.D(_007_),
    .Q(\raven_spi.U1.addr[3] ),
    .RESET_B(_026_),
    .CLK(SCK));
 sky130_fd_sc_hd__dfrtp_4 _285_ (.D(_008_),
    .Q(\raven_spi.U1.addr[4] ),
    .RESET_B(_027_),
    .CLK(SCK));
 sky130_fd_sc_hd__dfrtp_4 _286_ (.D(_009_),
    .Q(\raven_spi.U1.addr[5] ),
    .RESET_B(_028_),
    .CLK(SCK));
 sky130_fd_sc_hd__dfrtp_4 _287_ (.D(_010_),
    .Q(\raven_spi.U1.addr[6] ),
    .RESET_B(_029_),
    .CLK(SCK));
 sky130_fd_sc_hd__dfrtp_4 _288_ (.D(_011_),
    .Q(\raven_spi.U1.addr[7] ),
    .RESET_B(_030_),
    .CLK(SCK));
 sky130_fd_sc_hd__dfrtp_4 _289_ (.D(_012_),
    .Q(\raven_spi.U1.count[0] ),
    .RESET_B(_031_),
    .CLK(SCK));
 sky130_fd_sc_hd__dfrtp_4 _290_ (.D(_013_),
    .Q(\raven_spi.U1.count[1] ),
    .RESET_B(_032_),
    .CLK(SCK));
 sky130_fd_sc_hd__dfrtp_4 _291_ (.D(_014_),
    .Q(\raven_spi.U1.count[2] ),
    .RESET_B(_033_),
    .CLK(SCK));
 sky130_fd_sc_hd__dfrtp_4 _292_ (.D(_018_),
    .Q(\raven_spi.U1.writemode ),
    .RESET_B(_034_),
    .CLK(SCK));
 sky130_fd_sc_hd__dfrtp_4 _293_ (.D(_015_),
    .Q(\raven_spi.U1.fixed[0] ),
    .RESET_B(_035_),
    .CLK(SCK));
 sky130_fd_sc_hd__dfrtp_4 _294_ (.D(_016_),
    .Q(\raven_spi.U1.fixed[1] ),
    .RESET_B(_036_),
    .CLK(SCK));
 sky130_fd_sc_hd__dfrtp_4 _295_ (.D(_017_),
    .Q(\raven_spi.U1.fixed[2] ),
    .RESET_B(_037_),
    .CLK(SCK));
 sky130_fd_sc_hd__dfrtp_4 _296_ (.D(_019_),
    .Q(\raven_spi.U1.wrstb ),
    .RESET_B(_038_),
    .CLK(_039_));
 sky130_fd_sc_hd__dfrtp_4 _297_ (.D(_003_),
    .Q(\raven_spi.reset ),
    .RESET_B(_040_),
    .CLK(SCK));
 sky130_fd_sc_hd__decap_3 PHY_0 ();
 sky130_fd_sc_hd__decap_3 PHY_1 ();
 sky130_fd_sc_hd__decap_3 PHY_2 ();
 sky130_fd_sc_hd__decap_3 PHY_3 ();
 sky130_fd_sc_hd__decap_3 PHY_4 ();
 sky130_fd_sc_hd__decap_3 PHY_5 ();
 sky130_fd_sc_hd__decap_3 PHY_6 ();
 sky130_fd_sc_hd__decap_3 PHY_7 ();
 sky130_fd_sc_hd__decap_3 PHY_8 ();
 sky130_fd_sc_hd__decap_3 PHY_9 ();
 sky130_fd_sc_hd__decap_3 PHY_10 ();
 sky130_fd_sc_hd__decap_3 PHY_11 ();
 sky130_fd_sc_hd__decap_3 PHY_12 ();
 sky130_fd_sc_hd__decap_3 PHY_13 ();
 sky130_fd_sc_hd__decap_3 PHY_14 ();
 sky130_fd_sc_hd__decap_3 PHY_15 ();
 sky130_fd_sc_hd__decap_3 PHY_16 ();
 sky130_fd_sc_hd__decap_3 PHY_17 ();
 sky130_fd_sc_hd__decap_3 PHY_18 ();
 sky130_fd_sc_hd__decap_3 PHY_19 ();
 sky130_fd_sc_hd__decap_3 PHY_20 ();
 sky130_fd_sc_hd__decap_3 PHY_21 ();
 sky130_fd_sc_hd__decap_3 PHY_22 ();
 sky130_fd_sc_hd__decap_3 PHY_23 ();
 sky130_fd_sc_hd__decap_3 PHY_24 ();
 sky130_fd_sc_hd__decap_3 PHY_25 ();
 sky130_fd_sc_hd__decap_3 PHY_26 ();
 sky130_fd_sc_hd__decap_3 PHY_27 ();
 sky130_fd_sc_hd__decap_3 PHY_28 ();
 sky130_fd_sc_hd__decap_3 PHY_29 ();
 sky130_fd_sc_hd__decap_3 PHY_30 ();
 sky130_fd_sc_hd__decap_3 PHY_31 ();
 sky130_fd_sc_hd__decap_3 PHY_32 ();
 sky130_fd_sc_hd__decap_3 PHY_33 ();
 sky130_fd_sc_hd__decap_3 PHY_34 ();
 sky130_fd_sc_hd__decap_3 PHY_35 ();
 sky130_fd_sc_hd__decap_3 PHY_36 ();
 sky130_fd_sc_hd__decap_3 PHY_37 ();
 sky130_fd_sc_hd__decap_3 PHY_38 ();
 sky130_fd_sc_hd__decap_3 PHY_39 ();
 sky130_fd_sc_hd__decap_3 PHY_40 ();
 sky130_fd_sc_hd__decap_3 PHY_41 ();
 sky130_fd_sc_hd__decap_3 PHY_42 ();
 sky130_fd_sc_hd__decap_3 PHY_43 ();
 sky130_fd_sc_hd__decap_3 PHY_44 ();
 sky130_fd_sc_hd__decap_3 PHY_45 ();
 sky130_fd_sc_hd__decap_3 PHY_46 ();
 sky130_fd_sc_hd__decap_3 PHY_47 ();
 sky130_fd_sc_hd__decap_3 PHY_48 ();
 sky130_fd_sc_hd__decap_3 PHY_49 ();
 sky130_fd_sc_hd__decap_3 PHY_50 ();
 sky130_fd_sc_hd__decap_3 PHY_51 ();
 sky130_fd_sc_hd__decap_3 PHY_52 ();
 sky130_fd_sc_hd__decap_3 PHY_53 ();
 sky130_fd_sc_hd__decap_3 PHY_54 ();
 sky130_fd_sc_hd__decap_3 PHY_55 ();
 sky130_fd_sc_hd__decap_3 PHY_56 ();
 sky130_fd_sc_hd__decap_3 PHY_57 ();
 sky130_fd_sc_hd__decap_3 PHY_58 ();
 sky130_fd_sc_hd__decap_3 PHY_59 ();
 sky130_fd_sc_hd__decap_3 PHY_60 ();
 sky130_fd_sc_hd__decap_3 PHY_61 ();
 sky130_fd_sc_hd__decap_3 PHY_62 ();
 sky130_fd_sc_hd__decap_3 PHY_63 ();
 sky130_fd_sc_hd__decap_3 PHY_64 ();
 sky130_fd_sc_hd__decap_3 PHY_65 ();
 sky130_fd_sc_hd__decap_3 PHY_66 ();
 sky130_fd_sc_hd__decap_3 PHY_67 ();
 sky130_fd_sc_hd__decap_3 PHY_68 ();
 sky130_fd_sc_hd__decap_3 PHY_69 ();
 sky130_fd_sc_hd__decap_3 PHY_70 ();
 sky130_fd_sc_hd__decap_3 PHY_71 ();
 sky130_fd_sc_hd__decap_3 PHY_72 ();
 sky130_fd_sc_hd__decap_3 PHY_73 ();
 sky130_fd_sc_hd__decap_3 PHY_74 ();
 sky130_fd_sc_hd__decap_3 PHY_75 ();
 sky130_fd_sc_hd__decap_3 PHY_76 ();
 sky130_fd_sc_hd__decap_3 PHY_77 ();
 sky130_fd_sc_hd__decap_3 PHY_78 ();
 sky130_fd_sc_hd__decap_3 PHY_79 ();
 sky130_fd_sc_hd__decap_3 PHY_80 ();
 sky130_fd_sc_hd__decap_3 PHY_81 ();
 sky130_fd_sc_hd__decap_3 PHY_82 ();
 sky130_fd_sc_hd__decap_3 PHY_83 ();
 sky130_fd_sc_hd__decap_3 PHY_84 ();
 sky130_fd_sc_hd__decap_3 PHY_85 ();
 sky130_fd_sc_hd__decap_3 PHY_86 ();
 sky130_fd_sc_hd__decap_3 PHY_87 ();
 sky130_fd_sc_hd__decap_3 PHY_88 ();
 sky130_fd_sc_hd__decap_3 PHY_89 ();
 sky130_fd_sc_hd__decap_3 PHY_90 ();
 sky130_fd_sc_hd__decap_3 PHY_91 ();
 sky130_fd_sc_hd__decap_3 PHY_92 ();
 sky130_fd_sc_hd__decap_3 PHY_93 ();
 sky130_fd_sc_hd__decap_3 PHY_94 ();
 sky130_fd_sc_hd__decap_3 PHY_95 ();
 sky130_fd_sc_hd__decap_3 PHY_96 ();
 sky130_fd_sc_hd__decap_3 PHY_97 ();
 sky130_fd_sc_hd__decap_3 PHY_98 ();
 sky130_fd_sc_hd__decap_3 PHY_99 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_100 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_101 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_102 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_103 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_104 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_105 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_106 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_107 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_108 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_109 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_110 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_111 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_112 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_113 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_114 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_115 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_116 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_117 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_118 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_119 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_120 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_121 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_122 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_123 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_124 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_125 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_126 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_127 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_128 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_129 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_130 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_131 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_132 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_133 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_134 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_135 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_136 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_137 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_138 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_139 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_140 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_141 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_142 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_143 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_144 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_145 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_146 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_147 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_148 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_149 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_150 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_151 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_152 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_153 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_154 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_155 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_156 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_157 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_158 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_159 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_160 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_161 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_162 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_163 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_164 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_165 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_166 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_167 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_168 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_169 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_170 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_171 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_172 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_173 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_174 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_175 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_176 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_177 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_178 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_179 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_180 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_181 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_182 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_183 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_184 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_185 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_186 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_187 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_188 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_189 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_190 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_191 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_192 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_193 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_194 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_195 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_196 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_197 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_198 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_199 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_200 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_201 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_202 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_203 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_204 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_205 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_206 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_207 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_208 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_209 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_210 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_211 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_212 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_213 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_214 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_215 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_216 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_217 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_218 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_219 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_220 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_221 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_222 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_223 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_224 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_225 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_226 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_227 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_228 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_229 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_230 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_231 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_232 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_233 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_234 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_235 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_236 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_237 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_238 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_239 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_240 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_241 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_242 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_243 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_244 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_245 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_246 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_247 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_248 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_249 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_250 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_251 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_252 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_253 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_254 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_255 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_256 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_257 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_258 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_259 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_260 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_261 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_262 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_263 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_264 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_265 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_266 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_267 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_268 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_269 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_270 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_271 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_272 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_273 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_274 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_275 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_276 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_277 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_278 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_279 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_280 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_281 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_282 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_283 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_284 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_285 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_286 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_287 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_288 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_289 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_290 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_291 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_292 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_293 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_294 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_295 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_296 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_297 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_298 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_299 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_300 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_301 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_302 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_303 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_304 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_305 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_306 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_307 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_308 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_309 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_310 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_311 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_312 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_313 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_314 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_315 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_316 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_317 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_318 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_319 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_320 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_321 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_322 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_323 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_324 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_325 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_326 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_327 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_328 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_329 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_330 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_331 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_332 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 PHY_333 ();
 sky130_fd_sc_hd__diode_2 ANTENNA__140__A (.DIODE(CSB));
 sky130_fd_sc_hd__diode_2 ANTENNA__277__A (.DIODE(RST));
 sky130_fd_sc_hd__diode_2 ANTENNA__297__CLK (.DIODE(SCK));
 sky130_fd_sc_hd__diode_2 ANTENNA__295__CLK (.DIODE(SCK));
 sky130_fd_sc_hd__diode_2 ANTENNA__294__CLK (.DIODE(SCK));
 sky130_fd_sc_hd__diode_2 ANTENNA__293__CLK (.DIODE(SCK));
 sky130_fd_sc_hd__diode_2 ANTENNA__292__CLK (.DIODE(SCK));
 sky130_fd_sc_hd__diode_2 ANTENNA__291__CLK (.DIODE(SCK));
 sky130_fd_sc_hd__diode_2 ANTENNA__290__CLK (.DIODE(SCK));
 sky130_fd_sc_hd__diode_2 ANTENNA__289__CLK (.DIODE(SCK));
 sky130_fd_sc_hd__diode_2 ANTENNA__288__CLK (.DIODE(SCK));
 sky130_fd_sc_hd__diode_2 ANTENNA__287__CLK (.DIODE(SCK));
 sky130_fd_sc_hd__diode_2 ANTENNA__286__CLK (.DIODE(SCK));
 sky130_fd_sc_hd__diode_2 ANTENNA__285__CLK (.DIODE(SCK));
 sky130_fd_sc_hd__diode_2 ANTENNA__284__CLK (.DIODE(SCK));
 sky130_fd_sc_hd__diode_2 ANTENNA__283__CLK (.DIODE(SCK));
 sky130_fd_sc_hd__diode_2 ANTENNA__282__CLK (.DIODE(SCK));
 sky130_fd_sc_hd__diode_2 ANTENNA__281__CLK (.DIODE(SCK));
 sky130_fd_sc_hd__diode_2 ANTENNA__280__CLK (.DIODE(SCK));
 sky130_fd_sc_hd__diode_2 ANTENNA__279__CLK (.DIODE(SCK));
 sky130_fd_sc_hd__diode_2 ANTENNA__278__CLK (.DIODE(SCK));
 sky130_fd_sc_hd__diode_2 ANTENNA__139__A (.DIODE(SCK));
 sky130_fd_sc_hd__diode_2 ANTENNA__274__A (.DIODE(SDI));
 sky130_fd_sc_hd__diode_2 ANTENNA__259__A (.DIODE(SDI));
 sky130_fd_sc_hd__diode_2 ANTENNA__212__B2 (.DIODE(SDI));
 sky130_fd_sc_hd__diode_2 ANTENNA__196__D (.DIODE(SDI));
 sky130_fd_sc_hd__diode_2 ANTENNA_AMUX2_3V_select (.DIODE(select));
 sky130_fd_sc_hd__diode_2 ANTENNA__278__D (.DIODE(_000_));
 sky130_fd_sc_hd__diode_2 ANTENNA__279__D (.DIODE(_001_));
 sky130_fd_sc_hd__diode_2 ANTENNA__280__D (.DIODE(_002_));
 sky130_fd_sc_hd__diode_2 ANTENNA__297__D (.DIODE(_003_));
 sky130_fd_sc_hd__diode_2 ANTENNA__281__D (.DIODE(_004_));
 sky130_fd_sc_hd__diode_2 ANTENNA__282__D (.DIODE(_005_));
 sky130_fd_sc_hd__diode_2 ANTENNA__283__D (.DIODE(_006_));
 sky130_fd_sc_hd__diode_2 ANTENNA__284__D (.DIODE(_007_));
 sky130_fd_sc_hd__diode_2 ANTENNA__285__D (.DIODE(_008_));
 sky130_fd_sc_hd__diode_2 ANTENNA__286__D (.DIODE(_009_));
 sky130_fd_sc_hd__diode_2 ANTENNA__287__D (.DIODE(_010_));
 sky130_fd_sc_hd__diode_2 ANTENNA__288__D (.DIODE(_011_));
 sky130_fd_sc_hd__diode_2 ANTENNA__289__D (.DIODE(_012_));
 sky130_fd_sc_hd__diode_2 ANTENNA__290__D (.DIODE(_013_));
 sky130_fd_sc_hd__diode_2 ANTENNA__291__D (.DIODE(_014_));
 sky130_fd_sc_hd__diode_2 ANTENNA__293__D (.DIODE(_015_));
 sky130_fd_sc_hd__diode_2 ANTENNA__294__D (.DIODE(_016_));
 sky130_fd_sc_hd__diode_2 ANTENNA__295__D (.DIODE(_017_));
 sky130_fd_sc_hd__diode_2 ANTENNA__292__D (.DIODE(_018_));
 sky130_fd_sc_hd__diode_2 ANTENNA__296__D (.DIODE(_019_));
 sky130_fd_sc_hd__diode_2 ANTENNA__278__SET_B (.DIODE(_020_));
 sky130_fd_sc_hd__diode_2 ANTENNA__279__RESET_B (.DIODE(_021_));
 sky130_fd_sc_hd__diode_2 ANTENNA__280__RESET_B (.DIODE(_022_));
 sky130_fd_sc_hd__diode_2 ANTENNA__281__RESET_B (.DIODE(_023_));
 sky130_fd_sc_hd__diode_2 ANTENNA__282__RESET_B (.DIODE(_024_));
 sky130_fd_sc_hd__diode_2 ANTENNA__283__RESET_B (.DIODE(_025_));
 sky130_fd_sc_hd__diode_2 ANTENNA__284__RESET_B (.DIODE(_026_));
 sky130_fd_sc_hd__diode_2 ANTENNA__285__RESET_B (.DIODE(_027_));
 sky130_fd_sc_hd__diode_2 ANTENNA__286__RESET_B (.DIODE(_028_));
 sky130_fd_sc_hd__diode_2 ANTENNA__287__RESET_B (.DIODE(_029_));
 sky130_fd_sc_hd__diode_2 ANTENNA__288__RESET_B (.DIODE(_030_));
 sky130_fd_sc_hd__diode_2 ANTENNA__289__RESET_B (.DIODE(_031_));
 sky130_fd_sc_hd__diode_2 ANTENNA__290__RESET_B (.DIODE(_032_));
 sky130_fd_sc_hd__diode_2 ANTENNA__291__RESET_B (.DIODE(_033_));
 sky130_fd_sc_hd__diode_2 ANTENNA__292__RESET_B (.DIODE(_034_));
 sky130_fd_sc_hd__diode_2 ANTENNA__293__RESET_B (.DIODE(_035_));
 sky130_fd_sc_hd__diode_2 ANTENNA__294__RESET_B (.DIODE(_036_));
 sky130_fd_sc_hd__diode_2 ANTENNA__295__RESET_B (.DIODE(_037_));
 sky130_fd_sc_hd__diode_2 ANTENNA__296__RESET_B (.DIODE(_038_));
 sky130_fd_sc_hd__diode_2 ANTENNA__145__A (.DIODE(_038_));
 sky130_fd_sc_hd__diode_2 ANTENNA__144__A (.DIODE(_038_));
 sky130_fd_sc_hd__diode_2 ANTENNA__143__A (.DIODE(_038_));
 sky130_fd_sc_hd__diode_2 ANTENNA__142__A (.DIODE(_038_));
 sky130_fd_sc_hd__diode_2 ANTENNA__296__CLK (.DIODE(_039_));
 sky130_fd_sc_hd__diode_2 ANTENNA__297__RESET_B (.DIODE(_040_));
 sky130_fd_sc_hd__diode_2 ANTENNA__214__B1 (.DIODE(_041_));
 sky130_fd_sc_hd__diode_2 ANTENNA__195__C (.DIODE(_041_));
 sky130_fd_sc_hd__diode_2 ANTENNA__174__A (.DIODE(_041_));
 sky130_fd_sc_hd__diode_2 ANTENNA__276__A1 (.DIODE(_042_));
 sky130_fd_sc_hd__diode_2 ANTENNA__256__A1 (.DIODE(_042_));
 sky130_fd_sc_hd__diode_2 ANTENNA__250__B1 (.DIODE(_042_));
 sky130_fd_sc_hd__diode_2 ANTENNA__242__A (.DIODE(_042_));
 sky130_fd_sc_hd__diode_2 ANTENNA__175__A (.DIODE(_042_));
 sky130_fd_sc_hd__diode_2 ANTENNA__268__A1_N (.DIODE(_043_));
 sky130_fd_sc_hd__diode_2 ANTENNA__251__A1 (.DIODE(_043_));
 sky130_fd_sc_hd__diode_2 ANTENNA__247__A1 (.DIODE(_043_));
 sky130_fd_sc_hd__diode_2 ANTENNA__194__A1 (.DIODE(_043_));
 sky130_fd_sc_hd__diode_2 ANTENNA__190__B1 (.DIODE(_043_));
 sky130_fd_sc_hd__diode_2 ANTENNA__189__A1_N (.DIODE(_044_));
 sky130_fd_sc_hd__diode_2 ANTENNA__187__A (.DIODE(_044_));
 sky130_fd_sc_hd__diode_2 ANTENNA__208__B (.DIODE(_045_));
 sky130_fd_sc_hd__diode_2 ANTENNA__186__A (.DIODE(_045_));
 sky130_fd_sc_hd__diode_2 ANTENNA__269__B (.DIODE(_046_));
 sky130_fd_sc_hd__diode_2 ANTENNA__179__A (.DIODE(_046_));
 sky130_fd_sc_hd__diode_2 ANTENNA__270__A2 (.DIODE(_047_));
 sky130_fd_sc_hd__diode_2 ANTENNA__268__A2_N (.DIODE(_047_));
 sky130_fd_sc_hd__diode_2 ANTENNA__267__B2 (.DIODE(_047_));
 sky130_fd_sc_hd__diode_2 ANTENNA__267__A2_N (.DIODE(_047_));
 sky130_fd_sc_hd__diode_2 ANTENNA__180__B (.DIODE(_047_));
 sky130_fd_sc_hd__diode_2 ANTENNA__181__A (.DIODE(_048_));
 sky130_fd_sc_hd__diode_2 ANTENNA__268__B1 (.DIODE(_049_));
 sky130_fd_sc_hd__diode_2 ANTENNA__266__B1 (.DIODE(_049_));
 sky130_fd_sc_hd__diode_2 ANTENNA__213__A (.DIODE(_049_));
 sky130_fd_sc_hd__diode_2 ANTENNA__182__A (.DIODE(_049_));
 sky130_fd_sc_hd__diode_2 ANTENNA__219__D (.DIODE(_050_));
 sky130_fd_sc_hd__diode_2 ANTENNA__183__B (.DIODE(_050_));
 sky130_fd_sc_hd__diode_2 ANTENNA__184__A (.DIODE(_051_));
 sky130_fd_sc_hd__diode_2 ANTENNA__226__B1 (.DIODE(_052_));
 sky130_fd_sc_hd__diode_2 ANTENNA__212__A3 (.DIODE(_052_));
 sky130_fd_sc_hd__diode_2 ANTENNA__185__A (.DIODE(_052_));
 sky130_fd_sc_hd__diode_2 ANTENNA__271__B1 (.DIODE(_053_));
 sky130_fd_sc_hd__diode_2 ANTENNA__186__B (.DIODE(_053_));
 sky130_fd_sc_hd__diode_2 ANTENNA__189__A2_N (.DIODE(_054_));
 sky130_fd_sc_hd__diode_2 ANTENNA__187__B (.DIODE(_054_));
 sky130_fd_sc_hd__diode_2 ANTENNA__188__A (.DIODE(_055_));
 sky130_fd_sc_hd__diode_2 ANTENNA__191__A (.DIODE(_056_));
 sky130_fd_sc_hd__diode_2 ANTENNA__189__B2 (.DIODE(_056_));
 sky130_fd_sc_hd__diode_2 ANTENNA__190__B2 (.DIODE(_057_));
 sky130_fd_sc_hd__diode_2 ANTENNA__194__A3 (.DIODE(_058_));
 sky130_fd_sc_hd__diode_2 ANTENNA__194__B1 (.DIODE(_059_));
 sky130_fd_sc_hd__diode_2 ANTENNA__194__B2 (.DIODE(_060_));
 sky130_fd_sc_hd__diode_2 ANTENNA__197__A2 (.DIODE(_061_));
 sky130_fd_sc_hd__diode_2 ANTENNA__197__B1 (.DIODE(_062_));
 sky130_fd_sc_hd__diode_2 ANTENNA__258__B1 (.DIODE(_063_));
 sky130_fd_sc_hd__diode_2 ANTENNA__230__A1 (.DIODE(_063_));
 sky130_fd_sc_hd__diode_2 ANTENNA__221__A (.DIODE(_063_));
 sky130_fd_sc_hd__diode_2 ANTENNA__214__A1 (.DIODE(_063_));
 sky130_fd_sc_hd__diode_2 ANTENNA__199__C (.DIODE(_063_));
 sky130_fd_sc_hd__diode_2 ANTENNA__201__B (.DIODE(_064_));
 sky130_fd_sc_hd__diode_2 ANTENNA__200__A (.DIODE(_064_));
 sky130_fd_sc_hd__diode_2 ANTENNA__203__C (.DIODE(_065_));
 sky130_fd_sc_hd__diode_2 ANTENNA__202__A2 (.DIODE(_065_));
 sky130_fd_sc_hd__diode_2 ANTENNA__204__A2 (.DIODE(_066_));
 sky130_fd_sc_hd__diode_2 ANTENNA__202__B1 (.DIODE(_066_));
 sky130_fd_sc_hd__diode_2 ANTENNA__206__A2 (.DIODE(_067_));
 sky130_fd_sc_hd__diode_2 ANTENNA__205__B (.DIODE(_067_));
 sky130_fd_sc_hd__diode_2 ANTENNA__204__B1 (.DIODE(_067_));
 sky130_fd_sc_hd__diode_2 ANTENNA__206__B1_N (.DIODE(_068_));
 sky130_fd_sc_hd__diode_2 ANTENNA__257__B1 (.DIODE(_069_));
 sky130_fd_sc_hd__diode_2 ANTENNA__225__A (.DIODE(_069_));
 sky130_fd_sc_hd__diode_2 ANTENNA__219__A (.DIODE(_069_));
 sky130_fd_sc_hd__diode_2 ANTENNA__212__A1 (.DIODE(_069_));
 sky130_fd_sc_hd__diode_2 ANTENNA__213__B (.DIODE(_070_));
 sky130_fd_sc_hd__diode_2 ANTENNA__209__A (.DIODE(_070_));
 sky130_fd_sc_hd__diode_2 ANTENNA__268__B2 (.DIODE(_071_));
 sky130_fd_sc_hd__diode_2 ANTENNA__225__C (.DIODE(_071_));
 sky130_fd_sc_hd__diode_2 ANTENNA__219__C (.DIODE(_071_));
 sky130_fd_sc_hd__diode_2 ANTENNA__212__A2 (.DIODE(_071_));
 sky130_fd_sc_hd__diode_2 ANTENNA__258__A1_N (.DIODE(_072_));
 sky130_fd_sc_hd__diode_2 ANTENNA__252__A1 (.DIODE(_072_));
 sky130_fd_sc_hd__diode_2 ANTENNA__211__A (.DIODE(_072_));
 sky130_fd_sc_hd__diode_2 ANTENNA__260__A1 (.DIODE(_073_));
 sky130_fd_sc_hd__diode_2 ANTENNA__238__A (.DIODE(_073_));
 sky130_fd_sc_hd__diode_2 ANTENNA__226__A1 (.DIODE(_073_));
 sky130_fd_sc_hd__diode_2 ANTENNA__217__A (.DIODE(_073_));
 sky130_fd_sc_hd__diode_2 ANTENNA__212__B1 (.DIODE(_073_));
 sky130_fd_sc_hd__diode_2 ANTENNA__215__A2 (.DIODE(_074_));
 sky130_fd_sc_hd__diode_2 ANTENNA__270__C1 (.DIODE(_075_));
 sky130_fd_sc_hd__diode_2 ANTENNA__214__A2 (.DIODE(_075_));
 sky130_fd_sc_hd__diode_2 ANTENNA__216__B (.DIODE(_076_));
 sky130_fd_sc_hd__diode_2 ANTENNA__215__B2 (.DIODE(_076_));
 sky130_fd_sc_hd__diode_2 ANTENNA__223__A2 (.DIODE(_077_));
 sky130_fd_sc_hd__diode_2 ANTENNA__267__A1_N (.DIODE(_078_));
 sky130_fd_sc_hd__diode_2 ANTENNA__248__B1 (.DIODE(_078_));
 sky130_fd_sc_hd__diode_2 ANTENNA__241__A1 (.DIODE(_078_));
 sky130_fd_sc_hd__diode_2 ANTENNA__234__B1 (.DIODE(_078_));
 sky130_fd_sc_hd__diode_2 ANTENNA__220__A1 (.DIODE(_078_));
 sky130_fd_sc_hd__diode_2 ANTENNA__257__C1 (.DIODE(_079_));
 sky130_fd_sc_hd__diode_2 ANTENNA__226__A2 (.DIODE(_079_));
 sky130_fd_sc_hd__diode_2 ANTENNA__225__B (.DIODE(_079_));
 sky130_fd_sc_hd__diode_2 ANTENNA__219__B (.DIODE(_079_));
 sky130_fd_sc_hd__diode_2 ANTENNA__231__C (.DIODE(_080_));
 sky130_fd_sc_hd__diode_2 ANTENNA__230__B2 (.DIODE(_080_));
 sky130_fd_sc_hd__diode_2 ANTENNA__220__A2 (.DIODE(_080_));
 sky130_fd_sc_hd__diode_2 ANTENNA__227__B2 (.DIODE(_081_));
 sky130_fd_sc_hd__diode_2 ANTENNA__223__B1 (.DIODE(_081_));
 sky130_fd_sc_hd__diode_2 ANTENNA__270__A1 (.DIODE(_082_));
 sky130_fd_sc_hd__diode_2 ANTENNA__255__B1 (.DIODE(_082_));
 sky130_fd_sc_hd__diode_2 ANTENNA__250__A1 (.DIODE(_082_));
 sky130_fd_sc_hd__diode_2 ANTENNA__245__B1 (.DIODE(_082_));
 sky130_fd_sc_hd__diode_2 ANTENNA__222__A (.DIODE(_082_));
 sky130_fd_sc_hd__diode_2 ANTENNA__223__B2 (.DIODE(_083_));
 sky130_fd_sc_hd__diode_2 ANTENNA__267__B1 (.DIODE(_084_));
 sky130_fd_sc_hd__diode_2 ANTENNA__243__A1 (.DIODE(_084_));
 sky130_fd_sc_hd__diode_2 ANTENNA__235__B1 (.DIODE(_084_));
 sky130_fd_sc_hd__diode_2 ANTENNA__235__A1_N (.DIODE(_084_));
 sky130_fd_sc_hd__diode_2 ANTENNA__227__A1_N (.DIODE(_084_));
 sky130_fd_sc_hd__diode_2 ANTENNA__226__B2 (.DIODE(_085_));
 sky130_fd_sc_hd__diode_2 ANTENNA__227__A2_N (.DIODE(_086_));
 sky130_fd_sc_hd__diode_2 ANTENNA__241__A2 (.DIODE(_087_));
 sky130_fd_sc_hd__diode_2 ANTENNA__231__B (.DIODE(_087_));
 sky130_fd_sc_hd__diode_2 ANTENNA__230__A2 (.DIODE(_087_));
 sky130_fd_sc_hd__diode_2 ANTENNA__260__B1 (.DIODE(_088_));
 sky130_fd_sc_hd__diode_2 ANTENNA__258__A2_N (.DIODE(_088_));
 sky130_fd_sc_hd__diode_2 ANTENNA__234__B2 (.DIODE(_088_));
 sky130_fd_sc_hd__diode_2 ANTENNA__231__A (.DIODE(_088_));
 sky130_fd_sc_hd__diode_2 ANTENNA__230__B1 (.DIODE(_088_));
 sky130_fd_sc_hd__diode_2 ANTENNA__234__A1 (.DIODE(_089_));
 sky130_fd_sc_hd__diode_2 ANTENNA__232__A (.DIODE(_090_));
 sky130_fd_sc_hd__diode_2 ANTENNA__253__C (.DIODE(_091_));
 sky130_fd_sc_hd__diode_2 ANTENNA__240__B (.DIODE(_091_));
 sky130_fd_sc_hd__diode_2 ANTENNA__237__B (.DIODE(_091_));
 sky130_fd_sc_hd__diode_2 ANTENNA__233__A (.DIODE(_091_));
 sky130_fd_sc_hd__diode_2 ANTENNA__249__B (.DIODE(_092_));
 sky130_fd_sc_hd__diode_2 ANTENNA__245__A2 (.DIODE(_092_));
 sky130_fd_sc_hd__diode_2 ANTENNA__234__A2 (.DIODE(_092_));
 sky130_fd_sc_hd__diode_2 ANTENNA__235__A2_N (.DIODE(_093_));
 sky130_fd_sc_hd__diode_2 ANTENNA__253__A (.DIODE(_094_));
 sky130_fd_sc_hd__diode_2 ANTENNA__242__B (.DIODE(_094_));
 sky130_fd_sc_hd__diode_2 ANTENNA__240__A (.DIODE(_094_));
 sky130_fd_sc_hd__diode_2 ANTENNA__237__A (.DIODE(_094_));
 sky130_fd_sc_hd__diode_2 ANTENNA__248__A2 (.DIODE(_095_));
 sky130_fd_sc_hd__diode_2 ANTENNA__238__B (.DIODE(_095_));
 sky130_fd_sc_hd__diode_2 ANTENNA__246__B (.DIODE(_096_));
 sky130_fd_sc_hd__diode_2 ANTENNA__239__A (.DIODE(_096_));
 sky130_fd_sc_hd__diode_2 ANTENNA__241__B1 (.DIODE(_097_));
 sky130_fd_sc_hd__diode_2 ANTENNA__241__B2 (.DIODE(_098_));
 sky130_fd_sc_hd__diode_2 ANTENNA__243__A2 (.DIODE(_099_));
 sky130_fd_sc_hd__diode_2 ANTENNA__243__B1 (.DIODE(_100_));
 sky130_fd_sc_hd__diode_2 ANTENNA__253__B (.DIODE(_101_));
 sky130_fd_sc_hd__diode_2 ANTENNA__245__A1 (.DIODE(_101_));
 sky130_fd_sc_hd__diode_2 ANTENNA__247__A3 (.DIODE(_102_));
 sky130_fd_sc_hd__diode_2 ANTENNA__247__B2 (.DIODE(_103_));
 sky130_fd_sc_hd__diode_2 ANTENNA__251__A3 (.DIODE(_104_));
 sky130_fd_sc_hd__diode_2 ANTENNA__254__B1_N (.DIODE(_105_));
 sky130_fd_sc_hd__diode_2 ANTENNA__250__A2 (.DIODE(_105_));
 sky130_fd_sc_hd__diode_2 ANTENNA__251__B2 (.DIODE(_106_));
 sky130_fd_sc_hd__diode_2 ANTENNA__262__D (.DIODE(_107_));
 sky130_fd_sc_hd__diode_2 ANTENNA__256__A2 (.DIODE(_107_));
 sky130_fd_sc_hd__diode_2 ANTENNA__255__A2 (.DIODE(_108_));
 sky130_fd_sc_hd__diode_2 ANTENNA__255__C1 (.DIODE(_109_));
 sky130_fd_sc_hd__diode_2 ANTENNA__256__A3 (.DIODE(_110_));
 sky130_fd_sc_hd__diode_2 ANTENNA__263__A (.DIODE(_111_));
 sky130_fd_sc_hd__diode_2 ANTENNA__263__B (.DIODE(_112_));
 sky130_fd_sc_hd__diode_2 ANTENNA__264__A (.DIODE(_113_));
 sky130_fd_sc_hd__diode_2 ANTENNA__260__A2 (.DIODE(_113_));
 sky130_fd_sc_hd__diode_2 ANTENNA__263__C (.DIODE(_114_));
 sky130_fd_sc_hd__diode_2 ANTENNA__262__C (.DIODE(_115_));
 sky130_fd_sc_hd__diode_2 ANTENNA__263__D (.DIODE(_116_));
 sky130_fd_sc_hd__diode_2 ANTENNA__265__A2 (.DIODE(_117_));
 sky130_fd_sc_hd__diode_2 ANTENNA__264__B (.DIODE(_117_));
 sky130_fd_sc_hd__diode_2 ANTENNA__265__B1 (.DIODE(_118_));
 sky130_fd_sc_hd__diode_2 ANTENNA__270__B1 (.DIODE(_119_));
 sky130_fd_sc_hd__diode_2 ANTENNA__273__B (.DIODE(_120_));
 sky130_fd_sc_hd__diode_2 ANTENNA__272__B (.DIODE(_120_));
 sky130_fd_sc_hd__diode_2 ANTENNA__276__A2 (.DIODE(_121_));
 sky130_fd_sc_hd__diode_2 ANTENNA__276__A3 (.DIODE(_122_));
 sky130_fd_sc_hd__diode_2 ANTENNA__276__B1 (.DIODE(_123_));
 sky130_fd_sc_hd__diode_2 ANTENNA__276__B2 (.DIODE(_124_));
 sky130_fd_sc_hd__diode_2 ANTENNA__153__A (.DIODE(_125_));
 sky130_fd_sc_hd__diode_2 ANTENNA__146__A (.DIODE(_125_));
 sky130_fd_sc_hd__diode_2 ANTENNA__141__A (.DIODE(_125_));
 sky130_fd_sc_hd__diode_2 ANTENNA__162__A (.DIODE(_126_));
 sky130_fd_sc_hd__diode_2 ANTENNA__161__A (.DIODE(_126_));
 sky130_fd_sc_hd__diode_2 ANTENNA__160__A (.DIODE(_126_));
 sky130_fd_sc_hd__diode_2 ANTENNA__159__A (.DIODE(_126_));
 sky130_fd_sc_hd__diode_2 ANTENNA__147__A (.DIODE(_126_));
 sky130_fd_sc_hd__diode_2 ANTENNA__152__A (.DIODE(_127_));
 sky130_fd_sc_hd__diode_2 ANTENNA__151__A (.DIODE(_127_));
 sky130_fd_sc_hd__diode_2 ANTENNA__150__A (.DIODE(_127_));
 sky130_fd_sc_hd__diode_2 ANTENNA__149__A (.DIODE(_127_));
 sky130_fd_sc_hd__diode_2 ANTENNA__148__A (.DIODE(_127_));
 sky130_fd_sc_hd__diode_2 ANTENNA__158__A (.DIODE(_128_));
 sky130_fd_sc_hd__diode_2 ANTENNA__157__A (.DIODE(_128_));
 sky130_fd_sc_hd__diode_2 ANTENNA__156__A (.DIODE(_128_));
 sky130_fd_sc_hd__diode_2 ANTENNA__155__A (.DIODE(_128_));
 sky130_fd_sc_hd__diode_2 ANTENNA__154__A (.DIODE(_128_));
 sky130_fd_sc_hd__diode_2 ANTENNA__275__B1 (.DIODE(_129_));
 sky130_fd_sc_hd__diode_2 ANTENNA__246__A (.DIODE(_129_));
 sky130_fd_sc_hd__diode_2 ANTENNA__196__A (.DIODE(_129_));
 sky130_fd_sc_hd__diode_2 ANTENNA__193__B1 (.DIODE(_129_));
 sky130_fd_sc_hd__diode_2 ANTENNA__164__A (.DIODE(_129_));
 sky130_fd_sc_hd__diode_2 ANTENNA__256__B1 (.DIODE(_130_));
 sky130_fd_sc_hd__diode_2 ANTENNA__224__A (.DIODE(_130_));
 sky130_fd_sc_hd__diode_2 ANTENNA__220__B1 (.DIODE(_130_));
 sky130_fd_sc_hd__diode_2 ANTENNA__215__A1 (.DIODE(_130_));
 sky130_fd_sc_hd__diode_2 ANTENNA__190__A1 (.DIODE(_130_));
 sky130_fd_sc_hd__diode_2 ANTENNA__196__B (.DIODE(_131_));
 sky130_fd_sc_hd__diode_2 ANTENNA__178__C (.DIODE(_131_));
 sky130_fd_sc_hd__diode_2 ANTENNA__169__A1 (.DIODE(_131_));
 sky130_fd_sc_hd__diode_2 ANTENNA__203__A (.DIODE(_132_));
 sky130_fd_sc_hd__diode_2 ANTENNA__202__A1 (.DIODE(_132_));
 sky130_fd_sc_hd__diode_2 ANTENNA__178__A (.DIODE(_132_));
 sky130_fd_sc_hd__diode_2 ANTENNA__168__A (.DIODE(_132_));
 sky130_fd_sc_hd__diode_2 ANTENNA__203__B (.DIODE(_133_));
 sky130_fd_sc_hd__diode_2 ANTENNA__178__B (.DIODE(_133_));
 sky130_fd_sc_hd__diode_2 ANTENNA__168__B (.DIODE(_133_));
 sky130_fd_sc_hd__diode_2 ANTENNA__196__C (.DIODE(_134_));
 sky130_fd_sc_hd__diode_2 ANTENNA__169__A2 (.DIODE(_134_));
 sky130_fd_sc_hd__diode_2 ANTENNA__275__A2 (.DIODE(_135_));
 sky130_fd_sc_hd__diode_2 ANTENNA__193__A2 (.DIODE(_135_));
 sky130_fd_sc_hd__diode_2 ANTENNA__171__A (.DIODE(_135_));
 sky130_fd_sc_hd__diode_2 ANTENNA__170__B (.DIODE(_135_));
 sky130_fd_sc_hd__diode_2 ANTENNA__190__A2 (.DIODE(_136_));
 sky130_fd_sc_hd__diode_2 ANTENNA__274__B (.DIODE(_137_));
 sky130_fd_sc_hd__diode_2 ANTENNA__192__B (.DIODE(_137_));
 sky130_fd_sc_hd__diode_2 ANTENNA__172__B (.DIODE(_137_));
 sky130_fd_sc_hd__diode_2 ANTENNA__190__A3 (.DIODE(_138_));
 sky130_fd_sc_hd__diode_2 ANTENNA__222__B (.DIODE(\raven_spi.U1.addr[0] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__216__A (.DIODE(\raven_spi.U1.addr[0] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__215__B1 (.DIODE(\raven_spi.U1.addr[0] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__207__A (.DIODE(\raven_spi.U1.addr[0] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__223__A1 (.DIODE(\raven_spi.U1.addr[1] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__218__A (.DIODE(\raven_spi.U1.addr[1] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__257__A1 (.DIODE(\raven_spi.U1.addr[2] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__229__A (.DIODE(\raven_spi.U1.addr[2] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__227__B1 (.DIODE(\raven_spi.U1.addr[2] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__225__D (.DIODE(\raven_spi.U1.addr[2] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__258__B2 (.DIODE(\raven_spi.U1.addr[3] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__257__A2 (.DIODE(\raven_spi.U1.addr[3] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__235__B2 (.DIODE(\raven_spi.U1.addr[3] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__228__A (.DIODE(\raven_spi.U1.addr[3] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__262__A (.DIODE(\raven_spi.U1.addr[4] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__249__A (.DIODE(\raven_spi.U1.addr[4] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__247__A2 (.DIODE(\raven_spi.U1.addr[4] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__236__A (.DIODE(\raven_spi.U1.addr[4] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__262__B (.DIODE(\raven_spi.U1.addr[5] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__251__A2 (.DIODE(\raven_spi.U1.addr[5] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__249__C (.DIODE(\raven_spi.U1.addr[5] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__247__B1 (.DIODE(\raven_spi.U1.addr[5] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__244__A (.DIODE(\raven_spi.U1.addr[5] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__254__A1 (.DIODE(\raven_spi.U1.addr[6] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__252__B1 (.DIODE(\raven_spi.U1.addr[6] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__251__B1 (.DIODE(\raven_spi.U1.addr[6] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__248__A1 (.DIODE(\raven_spi.U1.addr[6] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__256__B2 (.DIODE(\raven_spi.U1.addr[7] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__255__A1 (.DIODE(\raven_spi.U1.addr[7] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__254__A2 (.DIODE(\raven_spi.U1.addr[7] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__252__A2 (.DIODE(\raven_spi.U1.addr[7] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__201__A (.DIODE(\raven_spi.U1.count[0] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__195__A (.DIODE(\raven_spi.U1.count[0] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__166__A (.DIODE(\raven_spi.U1.count[0] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__204__A1 (.DIODE(\raven_spi.U1.count[1] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__195__B (.DIODE(\raven_spi.U1.count[1] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__169__B1 (.DIODE(\raven_spi.U1.count[1] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__167__A (.DIODE(\raven_spi.U1.count[1] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__206__A1 (.DIODE(\raven_spi.U1.count[2] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__205__A (.DIODE(\raven_spi.U1.count[2] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__195__D (.DIODE(\raven_spi.U1.count[2] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__169__B2 (.DIODE(\raven_spi.U1.count[2] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__165__A (.DIODE(\raven_spi.U1.count[2] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__275__A1 (.DIODE(\raven_spi.U1.fixed[0] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__273__A (.DIODE(\raven_spi.U1.fixed[0] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__272__A (.DIODE(\raven_spi.U1.fixed[0] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__177__A (.DIODE(\raven_spi.U1.fixed[0] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__172__A (.DIODE(\raven_spi.U1.fixed[0] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__271__A1 (.DIODE(\raven_spi.U1.fixed[1] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__208__A (.DIODE(\raven_spi.U1.fixed[1] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__192__A (.DIODE(\raven_spi.U1.fixed[1] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__176__A (.DIODE(\raven_spi.U1.fixed[1] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__170__A (.DIODE(\raven_spi.U1.fixed[1] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__271__A2 (.DIODE(\raven_spi.U1.fixed[2] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__208__C (.DIODE(\raven_spi.U1.fixed[2] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__194__A2 (.DIODE(\raven_spi.U1.fixed[2] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__193__A1 (.DIODE(\raven_spi.U1.fixed[2] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__189__B1 (.DIODE(\raven_spi.U1.fixed[2] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__199__A (.DIODE(\raven_spi.U1.state[0] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__173__A (.DIODE(\raven_spi.U1.state[0] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__163__A (.DIODE(\raven_spi.U1.state[0] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__269__A (.DIODE(\raven_spi.U1.state[1] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__199__B (.DIODE(\raven_spi.U1.state[1] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__180__A (.DIODE(\raven_spi.U1.state[1] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__210__A (.DIODE(\raven_spi.U1.state[2] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__198__A (.DIODE(\raven_spi.U1.state[2] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__183__A (.DIODE(\raven_spi.U1.state[2] ));
 sky130_fd_sc_hd__diode_2 ANTENNA__266__A1 (.DIODE(\raven_spi.U1.writemode ));
 sky130_fd_sc_hd__diode_2 ANTENNA__197__A1 (.DIODE(\raven_spi.U1.writemode ));
 sky130_fd_sc_hd__diode_2 ANTENNA__266__A2 (.DIODE(\raven_spi.U1.wrstb ));
 sky130_fd_sc_hd__diode_2 ANTENNA__261__A (.DIODE(\raven_spi.U1.wrstb ));
 sky130_fd_sc_hd__diode_2 ANTENNA__265__A1 (.DIODE(\raven_spi.reset ));
 sky130_fd_sc_hd__diode_2 ANTENNA_AMUX2_3V_I1 (.DIODE(\raven_spi.reset ));
endmodule
