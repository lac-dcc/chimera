module QE_TB();

reg rCLK;

initial rCLK <=0;

always 
#1 rCLK<= !rCLK;

reg [9:0] rCOUNTER;
initial rCOUNTER<=0;

always @(posedge rCLK)
begin
  rCOUNTER<= rCOUNTER+1;

end

QUAD_ENCODER #(
    .pENCODERS(5)
  ) dut (
    .iCLK(rCLK),
    .iRESET(0),
    // AVALON SLAVE INTERFACE
    .iAVL_ADDRESS(rCOUNTER),
    .iAVL_READ(1),
    .oAVL_READ_DATA(),
    // ENCODER INPUTS
    .iENCODER_A({5{rCOUNTER[4]^rCOUNTER[5],rCOUNTER[5]}}),
    .iENCODER_B({5{rCOUNTER[5],rCOUNTER[4]^rCOUNTER[5]}})
  );

endmodule
