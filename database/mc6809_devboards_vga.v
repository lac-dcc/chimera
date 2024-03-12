`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:14:33 12/31/2015 
// Design Name: 
// Module Name:    vga
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

module vga_top(
                input logic_clock,
                input pixel_clock, 
                output hSync, 
                output vSync, 
                output [7:0] Red, 
                output [7:0] Green, 
                output [7:0] Blue, 
                output Blank,
                output [15:0] RAMAddr,
                input [7:0] RAMData
);
// svga 800X600 40Mhz pixel clock
        parameter   HRes = 800;
        parameter   VRes = 600;
        parameter   HStart = 840;
        parameter   VStart = 601;
        parameter   HStop = 968;
        parameter   VStop = 605;
        parameter   HMax = 1056;
        parameter   VMax = 628;
        
        
        localparam  LeftEmulatedEdge    = 144;
        localparam  RightEmulatedEdge   = LeftEmulatedEdge+512;
        
        localparam  StartHorizontalReadZone = LeftEmulatedEdge-8;
        localparam  StopHorizontalReadZone = RightEmulatedEdge;
        
	reg				  rhSync;
	reg				  rvSync;

    reg     [11:0]  hCount;
    reg     [11:0]  vCount;
    
    reg     [7:0]   rRed;
    reg     [7:0]   rGreen;
    reg     [7:0]   rBlue;
	 
	reg		[15:0]  rFrameCount;

    reg     rBlank;
    reg		rInvertColors=0;
   
    assign Blank = rBlank; 
	 
	 assign hSync = rhSync;
	 assign vSync = rvSync;

    assign Red = (Blank) ? rRed : 8'H00;
    assign Green = (Blank) ? rGreen: 8'H00;
    assign Blue = (Blank) ? rBlue : 8'H00;
    
    localparam      DEFAULT_DISPLAY_BASE=16'H0400;
	
    reg  [15:0]     RAMAddress = DEFAULT_DISPLAY_BASE;
    assign          RAMAddr=RAMAddress;


	reg				PatternOrRAM=1;		// If set to 0, the pattern is shown.  If set to 1, RAM fetches are shown.
	reg [15:0]		DisplayBase = DEFAULT_DISPLAY_BASE;	  // Default display address
    reg [15:0]      CurrentLineStart = DEFAULT_DISPLAY_BASE;
    reg [1:0]       TripleV = 2'b00;
    reg [7:0]       CharByte;
    reg [3:0]       RowNumber = 4'H0; // The font is 12 high

    wire [11:0]  activeHPos;
    
    //assign activeHPos = (hCount-12'd144);  // Our 512x576 window is flanked on left by 144 pixels (and on the right by 144)
 
    reg   [7:0] rVRAMByte;
    wire  [7:0] rRemappedByte;
    reg   [7:0] rBitmap;
    
    wire [7:0] GfxRemap;
    assign GfxRemap={4'H6, rVRAMByte[3:0]};
    reg [2:0] rGfxColor;
    reg       rGfxChar;
    assign rRemappedByte = (~rVRAMByte[7]) ? {rVRAMByte[7], ~rVRAMByte[6], rVRAMByte[5:0]} : GfxRemap; // The bit 6 invert is because my Character ROM wasn't exactly the same as the CoCo, so my sample didn't work - it was easier to change the hardware than the software.  :)
	   
    //wire [7:0]  charNum;
    //assign charNum = RAMData;// & 8'H7F; 
    
    wire [10:0]  charsetOffset;
    
    assign charsetOffset = {1'b0, rRemappedByte[7:0], 2'b00} + {rRemappedByte[7:0], 3'b000};   // x 12 rows/character
	
    
    reg   [11:0]   FontAddress=12'H000;
    wire  [7:0]    FontData;
    fontrom CharFont (
      .clka(pixel_clock), // input clka
      .addra(FontAddress), // input [10 : 0] addra
      .douta(FontData) // output [7 : 0] douta
    );   

// Video Frame Generation
    always @(posedge pixel_clock)
    begin

        // per pixel clock, increment horizontal; if it's at the last pixel
        // on a line, increment the vertical and set the horizontal to 0.
        // If vertical in that case hits the bottom of the screen, wrap it
        // back to 0.
        if (hCount == (HMax-1))
        begin
            hCount <= 0;
            
            if (vCount == (VMax-1))
                vCount <= 0;
            else
            begin
                vCount <= vCount + 1'b1;
                
                if (vCount > 11)
                begin
                    if (TripleV == 2'b10)
                    begin
                        if (RowNumber >= 11)
                        begin                        
                            RowNumber <= 0;
                            //CurrentLineStart <= (CurrentLineStart + 8'H20);
                        end
                        else
                        begin
                            RowNumber <= RowNumber + 1'b1;    
                            //RAMAddress <= CurrentLineStart;
                        end
                        TripleV <= 2'b00;
                    end
                    else
                        TripleV <= TripleV + 1'b1;                
                end
                else
                begin
                    RowNumber <= 4'H0;
                    TripleV <= 2'b00;
                end
            end

        end
        else // if hCount
        begin
           hCount <= hCount + 1'b1;
        end

        // Vertical Sync
        if ( (vCount >= VStart) && (vCount < VStop) )
		begin
				if (rvSync == 0)
				begin
					rFrameCount <= rFrameCount + 1'b1;
                    CurrentLineStart <= DisplayBase;
                    RowNumber <= 4'H0;
                    TripleV <= 2'b00;
				end
                rvSync <= 1;
		  end
        else
            rvSync <= 0;

        // Horizontal Sync
        if ( (hCount >= HStart) && (hCount < HStop) )
        begin
            rhSync <= 1;
            //RAMAddress <= CurrentLineStart;
        end
        else
        begin
            rhSync <= 0;

        end
				
        // If in the Display Range, set R, G, and B.
        if ( (hCount < HRes) && (vCount < VRes) )
        begin
             rBlank <= 1;             // (not blank)
             
             if ( (hCount >= StartHorizontalReadZone) && (hCount < StopHorizontalReadZone) )
             begin
                case (hCount[3:0])
                    4'H8: // Update RAMAddress [Latched by start here]
                    begin
                        if (hCount == StartHorizontalReadZone)
                            RAMAddress <= CurrentLineStart;
                        else if ( (hCount == (StopHorizontalReadZone-4'd8)) && (RowNumber == 4'd11) && (TripleV == 2'b10) )
                            CurrentLineStart <= CurrentLineStart+8'H20;
                        else
                            RAMAddress <= RAMAddress + 1'b1;
                    end
                    4'HB: // Latch Character # from Screen memory [latched by start here]
                    begin
                        rVRAMByte <= RAMData;
                    end
                    4'HC: // Read ROM byte [latched by start here]
                    begin
                        FontAddress <= (RowNumber + charsetOffset);
                    end
                    4'HF: // Copy ROM byte into workspot
                    begin
                        rBitmap <= FontData;
                        rGfxColor <= rVRAMByte[6:4];
                        rGfxChar <= rVRAMByte[7];
                    end
                endcase
             end

             if (PatternOrRAM == 1)
             begin

                if ((vCount < 12) | (vCount >= 588))
                begin
                    rRed <= 8'H00;
                    rBlue <= 8'H00;
                    rGreen <= 8'H00;
                end
                else
                begin
                    if ( (hCount < 144) | (hCount >= 656) )
                    begin
                        rRed <= 8'H00;
                        rBlue <= 8'H00;
                        rGreen <= 8'H00;
                    end
                    else
                    begin
                        if (rGfxChar)
                        begin
                            if (rBitmap[hCount[3:1] ^ 3'b111])
                            begin
                                case(rGfxColor)
                                    3'd0:
                                    begin
                                        rRed <= 8'H07;
                                        rGreen <= 8'HFF;
                                        rBlue <= 8'H00;
                                    end
                                    3'd1:
                                    begin
                                        rRed <= 8'HFF;
                                        rGreen <= 8'HFF;
                                        rBlue <= 8'H00;
                                    end 
                                    3'd2:
                                    begin
                                        rRed <= 8'H3B;
                                        rGreen <= 8'H08;
                                        rBlue <= 8'HFF;
                                    end
                                    3'd3:
                                    begin
                                        rRed <= 8'HCC;
                                        rGreen <= 8'H00;
                                        rBlue <= 8'H3B;
                                    end
                                    3'd4:
                                    begin
                                        rRed <= 8'HFF;
                                        rGreen <= 8'HFF;
                                        rBlue <= 8'HFF;
                                    end
                                    3'd5:
                                    begin
                                        rRed <= 8'H07;
                                        rGreen <= 8'HE3;
                                        rBlue <= 8'H99;
                                    end
                                    3'd6:
                                    begin
                                        rRed <= 8'HFF;
                                        rGreen <= 8'H1C;
                                        rBlue <= 8'HFF;
                                    end
                                    3'd7:
                                    begin
                                        rRed <= 8'HFF;
                                        rGreen <= 8'H81;
                                        rBlue <= 8'H00;
                                    end
                                    
                                    
                                endcase
                            end
                            else
                            begin
                                rRed <= 8'H00;
                                rGreen <= 8'H00;
                                rBlue <= 8'H00;
                            end
                        end
                        else
                        begin // text
                            if (rBitmap[hCount[3:1] ^ 3'b111])
                            begin
                                rRed <= 8'H00;
                                rGreen <= 8'H00;
                                rBlue <= 8'H00;
                            end
                            else
                            begin
                                rGreen <= 8'HFF;
                                rRed <= 8'H07;
                                rBlue <= 8'H00;
                            end

                                
                        end
                    end
                    
                end


             end
             else
             begin
                 rBlue[0] <= vCount[1] ^ rInvertColors;
                 rBlue[1] <= vCount[2] ^ rInvertColors;
                 rBlue[2] <= vCount[3] ^ rInvertColors;
                 rBlue[3] <= vCount[4] ^ rInvertColors;
                 rBlue[4] <= vCount[5] ^ rInvertColors;
                 rBlue[5] <= vCount[6] ^ rInvertColors;
                 rBlue[6] <= vCount[7] ^ rInvertColors;
                 rBlue[7] <= vCount[8] ^ rInvertColors;
                 rGreen[0] <= hCount[1] ^ rInvertColors;
                 rGreen[1] <= hCount[2] ^ rInvertColors;
                 rGreen[2] <= hCount[3] ^ rInvertColors;
                 rGreen[3] <= hCount[4] ^ rInvertColors;
                 rGreen[4] <= hCount[5] ^ rInvertColors;
                 rGreen[5] <= hCount[6] ^ rInvertColors;
                 rGreen[6] <= hCount[7] ^ rInvertColors;
                 rGreen[7] <= hCount[8] ^ rInvertColors;
                 rRed[0] <= hCount[0] ^ vCount[0];
                 rRed[1] <= hCount[1] ^ vCount[1];
                 rRed[2] <= hCount[2] ^ vCount[2];
                 rRed[3] <= hCount[3] ^ vCount[3];
                 rRed[4] <= hCount[4] ^ vCount[4];
                 rRed[5] <= hCount[5] ^ vCount[5];
                 rRed[6] <= hCount[6] ^ vCount[6];
                 rRed[7] <= hCount[7] ^ vCount[7];
             end


        end
        else
            rBlank <= 0;
        

    end // always



endmodule
