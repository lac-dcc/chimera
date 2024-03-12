module RAM32M (DOA, DOB, DOC, DOD, ADDRA, ADDRB, ADDRC, ADDRD, DIA, DIB, DIC, DID, WCLK, WE);

  parameter  [63:0] INIT_A = 64'h0000000000000000;
  parameter  [63:0] INIT_B = 64'h0000000000000000;
  parameter  [63:0] INIT_C = 64'h0000000000000000;
  parameter  [63:0] INIT_D = 64'h0000000000000000;


  output [1:0] DOA;
  output [1:0] DOB;
  output [1:0] DOC;
  output [1:0] DOD;
  input [4:0] ADDRA;
  input [4:0] ADDRB;
  input [4:0] ADDRC;
  input [4:0] ADDRD;
  input [1:0] DIA;
  input [1:0] DIB;
  input [1:0] DIC;
  input [1:0] DID;
  input WCLK;
  input WE;

  wire [4:0] ADDRD;
  wire [1:0] DIA, DIB, DIC, DID;
  wire WCLK, WE;
  reg [63:0] mem_a, mem_b, mem_c, mem_d;
  reg [5:0] addrd_in2, addrd_in1;

  initial begin
    mem_a = INIT_A;
    mem_b = INIT_B;
    mem_c = INIT_C;
    mem_d = INIT_D;
  end

  always @(ADDRD) begin
      addrd_in2 = 2 * ADDRD;
      addrd_in1 = 2 * ADDRD + 1;
  end
  always @(posedge WCLK)
    if (WE) begin
      mem_a[addrd_in2] <= DIA[0];
      mem_a[addrd_in1] <= DIA[1];
      mem_b[addrd_in2] <= DIB[0];
      mem_b[addrd_in1] <= DIB[1];
      mem_c[addrd_in2] <= DIC[0];
      mem_c[addrd_in1] <= DIC[1];
      mem_d[addrd_in2] <= DID[0];
      mem_d[addrd_in1] <= DID[1];
  end

   assign  DOA[0] = mem_a[2*ADDRA];
   assign  DOA[1] = mem_a[2*ADDRA + 1];
   assign  DOB[0] = mem_b[2*ADDRB];
   assign  DOB[1] = mem_b[2*ADDRB + 1];
   assign  DOC[0] = mem_c[2*ADDRC];
   assign  DOC[1] = mem_c[2*ADDRC + 1];
   assign  DOD[0] = mem_d[2*ADDRD];
   assign  DOD[1] = mem_d[2*ADDRD + 1];

endmodule

