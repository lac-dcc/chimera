// This program was cloned from: https://github.com/Qin-shihuang/BUAA_CO_2023
// License: MIT License

module GRF(
    input  wire         clk     ,
    input  wire         rst     ,
    input  wire [31:0]  PC      ,
    input  wire [4:0]   RS_Addr ,
    input  wire [4:0]   RT_Addr ,
    input  wire [4:0]   WA      ,
    input  wire         WE      ,
    input  wire [31:0]  WD      ,
    output wire [31:0]  RS      ,
    output wire [31:0]  RT
);
    /*
        General Register File
        32 * 32bit registers
    */
    reg [31:0] registers [31:0];
    
    integer i;

    assign RS = (RS_Addr == WA && WA && WE) ? WD : registers[RS_Addr];
    assign RT = (RT_Addr == WA && WA && WE) ? WD : registers[RT_Addr];

    always @(posedge clk) begin
        if (rst) begin 
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] <= 0;
            end
        end
        else begin
            if (WE) begin
                if (WA) begin
                    registers[WA] <= WD;
                    $display("%d@%h: $%d <= %h", $time, PC, WA, WD);
                end
            end
        end
    end
endmodule