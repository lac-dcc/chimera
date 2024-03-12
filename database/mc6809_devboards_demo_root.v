`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:10:21 10/24/2016 
// Design Name: 
// Module Name:    demo_root 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module demo_root(input OSCCLK,
            output hsync,
            output vsync,
            output [7:0] red,
            output [7:0] green,
            output [7:0] blue,
            output vga_clk,
            
            output [7:0] sseg,
            output [3:0] an,
            
            input ps2_clk,
            input ps2_data
    );

    wire    clk40Mhz;
    wire    clk100Mhz;
    wire    clk200Mhz;
    wire    clk50Mhz;
    reg     PLLReset=0;
    wire    PLLLocked;

    clk clkpll (
                .CLK_IN1(OSCCLK),       // IN
                .CLK_OUT1(clk40Mhz),    // OUT
                .CLK_OUT2(clk100Mhz),   // OUT
                .CLK_OUT3(clk50Mhz),
                .CLK_OUT4(clk200Mhz),
                .RESET(PLLReset),       // IN
                .LOCKED(PLLLocked)      // OUT
                );
                
    assign vga_clk = clk40Mhz;

    reg         BusRAMWriteEnable;
    reg [14:0]  BusRAMAddress;
    reg [7:0]   BusRAMWriteData;
    wire [7:0]  BusRAMReadData;
                
    wire [15:0] VideoRAMAddress;
    wire [7:0]  VideoRAMData;
              

    bram SRAM (
        .a_clk(clk200Mhz),
        .a_en(1'b1), 
        .a_wr(BusRAMWriteEnable),
        .a_addr(BusRAMAddress),
        .a_din(BusRAMWriteData),
        .a_dout(BusRAMReadData),
        .b_clk(clk40Mhz),
        .b_en(1'b1),
        .b_wr(1'b0),
        .b_addr(VideoRAMAddress[14:0]),
        .b_din(8'H49),
        .b_dout(VideoRAMData)
        );

    wire [7:0] vgared;
    wire [7:0] vgagreen;
    wire [7:0] vgablue;
    wire       vgahsync;
    wire       vgavsync;
    wire       vgablank;
    
    assign red = vgared[7:0];
    assign green = vgagreen[7:0];
    assign blue = vgablue[7:0];
    assign hsync = vgahsync;
    assign vsync = vgavsync;

    vga_top display(
                .logic_clock(clk100Mhz),
                .pixel_clock(clk40Mhz),
                .hSync(vgahsync),
                .vSync(vgavsync),
                .Red(vgared),
                .Green(vgagreen),
                .Blue(vgablue),
                .Blank(vgablank),
                .RAMAddr(VideoRAMAddress),
                .RAMData(VideoRAMData)
                );
              
    wire CodeROMCS;
    reg [9:0]       CodeROMAddr;
    wire [7:0]      CodeROMData;
    CPUROM CodeROM (
      .clka(clk200Mhz), // input clka
      .ena(1'b1), //CodeROMCS),
      .addra(CodeROMAddr), // input [9 : 0] addra
      .douta(CodeROMData) // output [7 : 0] douta
    );

    reg [7:0]   DToCPU;
    wire [7:0]  DFromCPU;
    wire [15:0] AFromCPU;
    wire        RnWFromCPU;
    wire        E;
    wire        Q;
    wire        BS;
    wire        BA;
    reg         nIRQ;
    reg         nFIRQ;
    reg         nNMI;
    reg         nHALT;
    reg         nRESET=0;
    reg         MRDY;
    reg         nDMABREQ;
    wire        xtal;       // actually useless

    
    reg [11:0]  PORCount=12'H000;
    
    always @(negedge clk50Mhz)
    begin
        if (PORCount == 12'HFFF)
        begin
            nRESET <= 1;
            nIRQ <= 1;
            nFIRQ <= 1;
            nNMI <= 1;
            nHALT <= 1;
            MRDY <= 1;
            nDMABREQ <= 1;
        end
        else
        begin
            nRESET <= 0;
            PORCount <= PORCount + 1'b1;
        end
    end

    wire nCPURESET;
    assign nCPURESET =  nRESET;
    reg [15:0] ACPULatched;
    reg [7:0]  DCPULatched;
    reg        RnWLatched;
     
    wire [15:0] ADDR;
    wire [7:0]  DOUT;
    wire        RNW;
    
    assign ADDR = (E|Q) ? AFromCPU : ACPULatched;
    assign RNW = (E|Q) ? RnWFromCPU : RnWLatched;
    assign DOUT = (E|Q) ? DFromCPU : DCPULatched;
     
    assign CodeROMCS = (ADDR[15:10] == 6'b101000);  // ROM at $A000-$A3FF  1010 00XX 
    wire VectorRemapCS = (ADDR[15:4] == 12'b111111111111); // $FFF0 -> $FFFF
    wire KeyboardFIFOCS = (ADDR[15:1] == (15'H7800)); // $F000 = FIFO Read, $F001 = FIFO Status

    // RAM maps in from 0000-7FFF
    wire RAMCS = (ADDR[15] == 1'b0);   
    
     always @(negedge Q)
     begin
        ACPULatched <= AFromCPU;
        RnWLatched <= RnWFromCPU;
        DCPULatched <= DFromCPU;
     end
     
     always @(negedge E)
     begin
        KeyFIFOAck <= KeyboardFIFOCS & (~ADDR[0]);
     end
    
     mc6809  cpu(
                    .D(DToCPU),
                    .DOut(DFromCPU),
                    .ADDR(AFromCPU),
                    .RnW(RnWFromCPU),
                    .E(E),
                    .Q(Q),
                    .BS(BS),
                    .BA(BA),
                    .nIRQ(nIRQ),
                    .nFIRQ(nFIRQ),
                    .nNMI(nNMI),
                    .EXTAL(clk100Mhz),
                    .XTAL(xtal),
                    .nHALT(nHALT),
                    .nRESET(nCPURESET),
                    .MRDY(MRDY),
                    .nDMABREQ(nDMABREQ)
                    );
                    
                    
    wire    [7:0]   KeyFIFOData;
    wire            KeyFIFOFull;
    wire            KeyFIFOEmpty;
    reg             KeyFIFOAck;

ps2_communication keybd(
        .reset(~nCPURESET),
        .clk(clk50Mhz),
        .ps2clk(ps2_clk),
        .ps2dat(ps2_data),
        .FIFOClock(E),
        .FIFOReadAck(KeyFIFOAck),
        .FIFORead(KeyFIFOData),
        .FIFOFull(KeyFIFOFull),
        .FIFOEmpty(KeyFIFOEmpty) );

    
    always @(*)
    begin
        CodeROMAddr = ADDR[9:0];        
        BusRAMAddress = ADDR[14:0];        

        BusRAMWriteEnable = (~RNW) & (RAMCS) & E;
        DToCPU = 8'H00;
        BusRAMWriteData = 8'H00;
        
        if (RNW) // Reads
        begin
            if (CodeROMCS | VectorRemapCS)
            begin
                DToCPU = CodeROMData;
            end
            else if (RAMCS)
            begin
                DToCPU = BusRAMReadData;
            end
            else if (KeyboardFIFOCS)
            begin
                if (~ADDR[0])
                begin
                    DToCPU = KeyFIFOData;
                end
                else
                begin
                    DToCPU = {6'b0, KeyFIFOFull, KeyFIFOEmpty};
                end
            end
        end
        else    // Writes
        begin
            // Writes to ROM are meaningless
            if (RAMCS)
            begin
                BusRAMWriteData = DOUT;
            end
        end
                        
     end

            
sseg sevenseg( .clk(clk50Mhz),
               .reset( ~nCPURESET ),
               .data({14'H0000, KeyFIFOFull, KeyFIFOEmpty}),
               .sseg(sseg),
               .an(an) );

     
endmodule
