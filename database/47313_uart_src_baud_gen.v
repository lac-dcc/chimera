// This program was cloned from: https://github.com/Revenantx86/uart
// License: MIT License

module baud_gen #
(
    parameter DIV_W = 16
)
(
    input  wire             clk,
    input  wire             rst,
    input  wire [DIV_W-1:0] DIVxR,
    output reg              b_clk,
    input  wire             b_en
);

    // Internal Wire and register definitions // 
    //
    reg [DIV_W-1:0] r_reg; // 16 bit register to keep counter
    //
    // -- Control Counter -- //
    always @(posedge clk or posedge rst) begin
        if(rst) 
            r_reg <= 0;
        else if (b_en) begin
            if (r_reg == DIVxR)         // If counter reaches the dvst, reset counter
                r_reg <= 0;
            else
                r_reg <= r_reg + 1;     // Else Keep Counting
        end
    end
    //
    // -- Control Tick -- //
    always @(posedge clk or posedge rst) begin
        if(rst)
            b_clk <= 0;
        else if(r_reg == DIVxR)         // If counter reaches the DVSR, trigger baud_clk 
            b_clk <= 1;
        else
            b_clk <= 0;
    end
    //
endmodule