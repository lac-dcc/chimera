// This program was cloned from: https://github.com/tlimato/ee2390_final
// License: MIT License

// fourdigitdriver.v
// Drives BASYS 3 Board Display
// Takes 4 hex characters and 4 dots as input

module fourdigitdriver(A, B, C, D, clk, dots, seg, an, dp, flashing);
    input clk;
    input [3:0] A, B, C, D; // 4 sections of display A-D
    input [0:3] dots; // individual decimal points
    input flashing; 
    output reg [3:0] an;
    output [0:6] seg;
    output reg dp; // all decimal points
    
    reg [17:0] refreshCount = 0;
    reg [25:0] flashingCount = 1;
    reg [1:0] switch = 0;
    reg [3:0] Hex;
    
    reg flashState = 0;
    
    integer x;
    
    sevensegdecoder  u1(.Seg(seg[0:6]), .HexVal(Hex));
    
    always @(posedge clk)
    begin
        if(flashingCount == 0) // return to present state - no flash
            flashState = !flashState;
    
        if(refreshCount == 0) // if not flashing - as set above  
           begin       
           case(switch) //switch implementation
                2'b00:
                begin
                    Hex = A; // input 
                    an = 4'b0111; // initialize display A
                    if(!dots[0]) dp = 1; // dot 0 on
                    else dp = 0;
                end
                2'b01:
                begin
                    Hex = B; // input 
                    an = 4'b1011; // initialize display B
                    if(!dots[1]) dp = 1; // dot 1 off
                    else dp = 0;
                end
                2'b10:
                begin
                    Hex = C; // input 
                    an = 4'b1101; // initialize display C
                    if(!dots[2]) dp = 1; // dot 2 on
                    else dp = 0;
                end
                2'b11:
                begin
                    Hex = D; // input 
                    an = 4'b1110; // initialize display D
                    if(!dots[3]) dp = 1; // dot 3 off
                    else dp = 0;
                end

            endcase
            switch = switch + 1'b1; // increment switch to initialize all display drivers
        end
        
        if(flashState == 1 && flashing == 1)
            an = 4'b1111; // flash

        // number count rolls over to 0 automatically
        refreshCount = refreshCount + 1'b1;
        flashingCount = flashingCount + 1'b1;
    end
endmodule