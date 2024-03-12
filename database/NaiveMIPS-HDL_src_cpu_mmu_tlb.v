`default_nettype none
module tlb(
  input wire[89:0] tlbConfig,
  input wire tlbwi,
  input wire tlbp,

  output wire[31:0] tlbp_result,

  input wire[31:0] dataAddrVirt,
  input wire[31:0] insAddrVirt,

  input wire[7:0] nowASID,

  output wire dataMiss,
  output wire insMiss,
  output wire dataDirt,
  output wire insDirt,
  output wire insValid,
  output wire dataValid,
  
  output wire dataBypassCache,
  output wire insBypassCache,

  output wire[31:0] dataAddrPhy,
  output wire[31:0] insAddrPhy,

  input wire rst_n,
  input wire clk
);


wire[18:0] tlbEntryVpn2;
wire[23:0] tlbEntryPFN0;
wire tlbEntryD0; //reserve
wire tlbEntryV0;
wire[23:0] tlbEntryPFN1;
wire tlbEntryD1; //reserve
wire tlbEntryV1;
wire[3:0] tlbEntryIndex;
wire[7:0] tlbEntryASID;
wire tlbEntryG;
wire[2:0] tlbEntryC0;
wire[2:0] tlbEntryC1;

assign {
  tlbEntryC0,   //[85:83]
  tlbEntryC1,   //[82:80]
  tlbEntryASID, //[79:72]
  tlbEntryG,    //71
  tlbEntryVpn2, //[70:52]
  tlbEntryPFN1, //[51:28]
  tlbEntryD1, tlbEntryV1,//27,26
  tlbEntryPFN0,//[25:2]
  tlbEntryD0, tlbEntryV0, //1, 0
  tlbEntryIndex
} = tlbConfig;//refer to cp0.v

reg[85:0] tlbEntries[0:15];

tlbConverter conv4inst(

//  .tlbEntries(tlbEntries),

  .tlbEntry0(tlbEntries[0]),
  .tlbEntry1(tlbEntries[1]),
  .tlbEntry2(tlbEntries[2]),
  .tlbEntry3(tlbEntries[3]),
  .tlbEntry4(tlbEntries[4]),
  .tlbEntry5(tlbEntries[5]),
  .tlbEntry6(tlbEntries[6]),
  .tlbEntry7(tlbEntries[7]),
  .tlbEntry8(tlbEntries[8]),
  .tlbEntry9(tlbEntries[9]),
  .tlbEntry10(tlbEntries[10]),
  .tlbEntry11(tlbEntries[11]),
  .tlbEntry12(tlbEntries[12]),
  .tlbEntry13(tlbEntries[13]),
  .tlbEntry14(tlbEntries[14]),
  .tlbEntry15(tlbEntries[15]),

  .phyAddr(insAddrPhy),
  .virtAddr(insAddrVirt),
  .miss(insMiss),
  .nowASID(nowASID),
  .matchWhich(),
  .valid(insValid),
  .dirt(insDirt),
  .bypassCache(insBypassCache)
);

tlbConverter conv4data(

//  .tlbEntries(tlbEntries),

  .tlbEntry0(tlbEntries[0]),
  .tlbEntry1(tlbEntries[1]),
  .tlbEntry2(tlbEntries[2]),
  .tlbEntry3(tlbEntries[3]),
  .tlbEntry4(tlbEntries[4]),
  .tlbEntry5(tlbEntries[5]),
  .tlbEntry6(tlbEntries[6]),
  .tlbEntry7(tlbEntries[7]),
  .tlbEntry8(tlbEntries[8]),
  .tlbEntry9(tlbEntries[9]),
  .tlbEntry10(tlbEntries[10]),
  .tlbEntry11(tlbEntries[11]),
  .tlbEntry12(tlbEntries[12]),
  .tlbEntry13(tlbEntries[13]),
  .tlbEntry14(tlbEntries[14]),
  .tlbEntry15(tlbEntries[15]),

  .phyAddr(dataAddrPhy),
  .virtAddr(dataAddrVirt),
  .miss(dataMiss),
  .nowASID(nowASID),
  .matchWhich(),
  .valid(dataValid),
  .dirt(dataDirt),
  .bypassCache(dataBypassCache)
);

tlbConverter prober(

//  .tlbEntries(tlbEntries),

  .tlbEntry0(tlbEntries[0]),
  .tlbEntry1(tlbEntries[1]),
  .tlbEntry2(tlbEntries[2]),
  .tlbEntry3(tlbEntries[3]),
  .tlbEntry4(tlbEntries[4]),
  .tlbEntry5(tlbEntries[5]),
  .tlbEntry6(tlbEntries[6]),
  .tlbEntry7(tlbEntries[7]),
  .tlbEntry8(tlbEntries[8]),
  .tlbEntry9(tlbEntries[9]),
  .tlbEntry10(tlbEntries[10]),
  .tlbEntry11(tlbEntries[11]),
  .tlbEntry12(tlbEntries[12]),
  .tlbEntry13(tlbEntries[13]),
  .tlbEntry14(tlbEntries[14]),
  .tlbEntry15(tlbEntries[15]),

  .phyAddr(),
  .virtAddr({tlbConfig[74:56], {13{1'b0}}}),
  .miss(tlbp_result[31]),
  .nowASID(nowASID),
  .matchWhich(tlbp_result[3:0]),
  .valid(),
  .dirt(),
  .bypassCache()
);

always @(posedge clk) begin

  if (rst_n == 0) begin :label
    integer i;
    for(i=0; i<16; i=i+1) begin
      tlbEntries[i] <= 80'd0;
    end
  end else begin
    if (tlbwi) begin
      tlbEntries[tlbEntryIndex] [85:0] <= tlbConfig[89:4];
    end
  end
end



endmodule
