// This program was cloned from: https://github.com/jameshegarty/rigel
// License: MIT License

module RAMB16_RIGEL(
                    WEA,
                    ENA,
                    SSRA,
                    CLKA,
                    ADDRA,
                    DIPA,
                    DIA,
                    DOA,
                    DIB,
                    DOB,
                    WEB,
                    ENB,
                    SSRB,
                    CLKB,
                    ADDRB,
                    DIPB);
   
   parameter WRITE_MODE_A = "write_first";
   parameter WRITE_MODE_B = "write_first";

   parameter INIT_00=256'd0;
   parameter INIT_01=256'd0;
   parameter INIT_02=256'd0;
   parameter INIT_03=256'd0;
   parameter INIT_04=256'd0;
   parameter INIT_05=256'd0;
   parameter INIT_06=256'd0;
   parameter INIT_07=256'd0;
   parameter INIT_08=256'd0;
   parameter INIT_09=256'd0;
   parameter INIT_0A=256'd0;
   parameter INIT_0B=256'd0;
   parameter INIT_0C=256'd0;
   parameter INIT_0D=256'd0;
   parameter INIT_0E=256'd0;
   parameter INIT_0F=256'd0;
   parameter INIT_10=256'd0;
   parameter INIT_11=256'd0;
   parameter INIT_12=256'd0;
   parameter INIT_13=256'd0;
   parameter INIT_14=256'd0;
   parameter INIT_15=256'd0;
   parameter INIT_16=256'd0;
   parameter INIT_17=256'd0;
   parameter INIT_18=256'd0;
   parameter INIT_19=256'd0;
   parameter INIT_1A=256'd0;
   parameter INIT_1B=256'd0;
   parameter INIT_1C=256'd0;
   parameter INIT_1D=256'd0;
   parameter INIT_1E=256'd0;
   parameter INIT_1F=256'd0;
   parameter INIT_20=256'd0;
   parameter INIT_21=256'd0;
   parameter INIT_22=256'd0;
   parameter INIT_23=256'd0;
   parameter INIT_24=256'd0;
   parameter INIT_25=256'd0;
   parameter INIT_26=256'd0;
   parameter INIT_27=256'd0;
   parameter INIT_28=256'd0;
   parameter INIT_29=256'd0;
   parameter INIT_2A=256'd0;
   parameter INIT_2B=256'd0;
   parameter INIT_2C=256'd0;
   parameter INIT_2D=256'd0;
   parameter INIT_2E=256'd0;
   parameter INIT_2F=256'd0;
   parameter INIT_30=256'd0;
   parameter INIT_31=256'd0;
   parameter INIT_32=256'd0;
   parameter INIT_33=256'd0;
   parameter INIT_34=256'd0;
   parameter INIT_35=256'd0;
   parameter INIT_36=256'd0;
   parameter INIT_37=256'd0;
   parameter INIT_38=256'd0;
   parameter INIT_39=256'd0;
   parameter INIT_3A=256'd0;
   parameter INIT_3B=256'd0;
   parameter INIT_3C=256'd0;
   parameter INIT_3D=256'd0;
   parameter INIT_3E=256'd0;   
   parameter INIT_3F=256'd0;
   
   parameter BITS=1;

   input      WEA;
   input      ENA;
   input      SSRA;
   input      CLKA;
   input [13-$clog2(BITS):0] ADDRA;
   input [((BITS<8?8:BITS)/8)-1:0]          DIPA;
   
   input [BITS-1:0]        DIA;
   output [BITS-1:0]       DOA;
   input [BITS-1:0]        DIB;
   output [BITS-1:0]       DOB;
   
   input                      WEB;
   input                      ENB;
   input                      SSRB;
   input                      CLKB;
   input [13-$clog2(BITS):0] ADDRB;
   input [((BITS<8?8:BITS)/8)-1:0]          DIPB;
   
   reg [BITS-1:0]          ram [(2048*8)/BITS-1:0];
   reg [BITS-1:0]          bufferA;
   reg [BITS-1:0]          bufferB;

   reg [16383:0]              initpacked  = {INIT_3F,INIT_3E,INIT_3D,INIT_3C,INIT_3B,INIT_3A,INIT_39,INIT_38,INIT_37,INIT_36,INIT_35,INIT_34,INIT_33,INIT_32,INIT_31,INIT_30,INIT_2F,INIT_2E,INIT_2D,INIT_2C,INIT_2B,INIT_2A,INIT_29,INIT_28,INIT_27,INIT_26,INIT_25,INIT_24,INIT_23,INIT_22,INIT_21,INIT_20,INIT_1F,INIT_1E,INIT_1D,INIT_1C,INIT_1B,INIT_1A,INIT_19,INIT_18,INIT_17,INIT_16,INIT_15,INIT_14,INIT_13,INIT_12,INIT_11,INIT_10,INIT_0F,INIT_0E,INIT_0D,INIT_0C,INIT_0B,INIT_0A,INIT_09,INIT_08,INIT_07,INIT_06,INIT_05,INIT_04,INIT_03,INIT_02,INIT_01,INIT_00};

   reg [31:0] i=0;
   reg [31:0] j=0;
   
initial begin
   for(i=0; i<(2048*8)/BITS-1; i=i+1) begin
      for(j=0; j<BITS; j=j+1) begin
         ram[i][j] = initpacked[i*BITS+j];
      end
   end   
end
   
  assign DOA = bufferA;
  assign DOB = bufferB;

//  assign DOPA = 4'b0;
//  assign DOPB = 4'b0;

  always @(posedge CLKA or posedge CLKB) begin

    if( CLKA && CLKB && ENA && ENB && WEA && WEB ) begin
      if(ADDRA==ADDRB) begin
        $display("ERROR: write to some address on both ports");
      end else begin
        // different address: OK
        bufferA <= ram[ADDRA];
        bufferB <= ram[ADDRB];
        ram[ADDRA] <= DIA;
        ram[ADDRB] <= DIB;
      end
    end else begin
      // not writing on both ports: can treat A/B differently
      
      if (CLKA && ENA) begin
        if (WEA) begin
          ram[ADDRA] <= DIA;
          bufferA <= ram[ADDRA];
        end else begin
          bufferA <= ram[ADDRA];
        end
      end

      if (CLKB && ENB) begin
        if (WEB) begin
          ram[ADDRB] <= DIB;
          bufferB <= ram[ADDRB];
        end else begin
          bufferB <= ram[ADDRB];
        end
      end

    end

  end



endmodule
