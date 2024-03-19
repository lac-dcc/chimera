`timescale 1ns / 1ps 
module TinyComp( 
 input Ph0, Ph1, //clock phases 
 input Reset, 

 output [31:00] IOaddr, // I/O address
 input [31:00] InData, // I/O input 
 input InRdy, 
 output InStrobe, //We are executing an Input instruction 

 output [31:00] OutData, // I/O output 
 output OutStrobe //We are executing an Output instruction 
); 
wire doSkip; 
wire [31:00] WD; //write data to the register file 
wire [23:00] WDmid;  //the WD mux intermediate outputs 
wire [31:00] RFAout; //register file port A read data 
wire [31:00] RFBout; //register file port B read data 
reg  [6:0]   PC; //7-bit program counter 
wire [6:0]   PCinc, PCinc2, PCmux; 
wire [31:00] ALU; // ALUoutput 
wire [31:00] AddSubUnit; 
wire [31:00] ALUresult; 
wire [31:00] DM; //the Data memory (1K x 32) outputs 
wire [31:00] IM; //the Instruction memory (1K x 32) outputs 
wire [2:0] Op; // Current instruction op
wire LoadC; // Current instruction is loading a constant
wire WriteIM, WriteDM, Jump, LoadDM, LoadALU; //Opcode decodes 
//----------End of declarations------------ 
//this is the only register, other than the registers in the block RAMs. 
// Everything else is combinational. 
 always @(posedge Ph0) 
  if(Reset) PC <= 0; 
  else PC <= PCmux; 

assign OutData = RFAout;
assign IOaddr = RFBout;

assign Op = IM[2:0];
assign LoadC = IM[24];

//the Skip Tester. 1 LUT 
assign doSkip = (~LoadC & ~IM[4] &  IM[3] & ALU[31]) | 
                (~LoadC &  IM[4] & ~IM[3] & (ALU == 0)) | 
                (~LoadC &  IM[4] &  IM[3] & InRdy); 
                
//Opcode decode.  7 LUTs 
 assign WriteIM   = ~LoadC & (Op == 1); 
 assign WriteDM   = ~LoadC & (Op == 2); 
 assign OutStrobe = ~LoadC & (Op == 3); 
 assign LoadDM    = ~LoadC & (Op == 4); 
 assign InStrobe  = ~LoadC & (Op == 5);
 assign Jump      = ~LoadC & (Op == 6);
 assign LoadALU  =  ~LoadC & ~IM[2] ;                  //Ops 0..3 
// instantiate the WD multiplexer. 24*2 + 8 = 56 LUTs 
 genvar i; 
 generate 
  for(i = 0; i < 32; i = i+1) 
  begin: wsblock 
   if(i < 10 )begin 
    assign WDmid[i] = (LoadALU & ALU[i]) | (InStrobe & InData[i]) | (LoadDM & DM[i]); 
//6-in 
   if(i < 7 )begin 
      assign WD[i] = (Jump & PCinc[i]) | (LoadC & IM[i]) | WDmid[i]; //5-in 
   end else begin
      assign WD[i] = (LoadC & IM[i]) | WDmid[i]; //5-in 
   end
  end else if(i < 24) begin 
    assign WDmid[i] = (LoadALU & ALU[i]) | (InStrobe & InData[i]) | (LoadDM & DM[i]); 
//6-in 
    assign WD[i] = (LoadC & IM[i]) | WDmid[i]; //3-in 
  end else 
    assign WD[i] = (LoadALU & ALU[i]) | (InStrobe & InData[i]) | (LoadDM & DM[i]); //6-in 
  end //wsblock 
endgenerate 
//the PC-derived signals 

 assign PCinc =  PC + 1; 
 assign PCinc2 = PC + 2; 
 assign PCmux = Jump ? ALU[6:0] : doSkip ? PCinc2 : PCinc; 
//instantiate the IM. Read during Ph0, written (if needed) at the beginning of the next Ph0
 ramx im( 
   .clkb(Ph0 ), .addrb(PCmux[6:0]),                .doutb(IM),     //the read port 
   .clka(Ph0), .addra(RFBout[6:0]), .wea(WriteIM), .dina(RFAout)); //the write port 
    
//instantiate the DM. Read during Ph1, written (if needed) at the beginning of the next Ph0 
 ramw dm( 
   .clkb(Ph1), .addrb(RFBout[6:0]),                .doutb(DM),  //the read port 
   .clka(Ph0), .addra(RFBout[6:0]), .wea(WriteDM), .dina(RFAout)); //the write port 
   
//instantiate the register file.  This has three independent addresses, so two BRAMs are needed. 
// read after the read and write addresses are stable (rise of Ph1) written at the end of the 
// instruction (rise of Ph0). 
 ramz rfA(.addra(IM[31:25]), .clka(Ph0), .wea(1'b1), .dina(WD), //write port 
   .clkb(Ph1), .addrb(IM[23:17]), .doutb(RFAout));              //read port 
 ramz rfB(.addra(IM[31:25]), .clka(Ph0), .wea(1'b1), .dina(WD), //write port 
   .clkb(Ph1), .addrb(IM[16:10]), .doutb(RFBout));              //read port 
//instantiate the ALU: An adder/subtractor followed by a shifter 
//32 LUTs. IM[8] => mask A, IM[7] => complement B, insert Cin 
 assign AddSubUnit = IM[8]? (RFBout + (IM[7] ? -1 : 1))              // B-1, B+1
                          : (RFAout + (IM[7] ? ~RFBout : RFBout));   // A-B, A+B
//generate the ALU and shifter one bit at a time 
 genvar j; 
 generate 
  for(j = 0; j < 32; j = j+1) 
   begin: shblock 
    assign ALUresult[j] =  //32 LUTs 
     (~IM[9] & AddSubUnit[j]) |  //0-3: A+B, A-B, B+1, B-1 
     ( IM[9] & ~IM[8] & ~IM[7] & (RFAout[j] & RFBout[j])) | //4: and 
     ( IM[9] & ~IM[8] &  IM[7] & (RFAout[j] | RFBout[j])) | //5: or 
     ( IM[9] &  IM[8] &  IM[7] & (RFAout[j] ^ RFBout[j])) ; //6: xor 
    assign ALU[j] = //32 LUTs 
     (~IM[6] & ~IM[5] & ALUresult[j]) | //0: no cycle 
     (~IM[6] &  IM[5] & ALUresult[(j + 1)  % 32]) | //1: rcy 1 
     ( IM[6] & ~IM[5] & ALUresult[(j + 8)  % 32]) | //2: rcy 8 
     ( IM[6] &  IM[5] & ALUresult[(j + 16) % 32]) ; //rcy 16 
   end //shblock 
 endgenerate 
endmodule 
   
