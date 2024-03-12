`default_nettype none
module digit
    #(
    parameter DIGIT_INDEX_FILE = "digit_index.hex",
    parameter COL_INDEX_FILE = "col_index.hex",
    parameter COLOR_INDEX_FILE = "color.hex",
    parameter FONT_W = 3,
    parameter FONT_H = 5,
    parameter NUM_BLOCKS = 20
    )
    (
    input wire clk,
    input wire [5:0] x_block,
    // input wire [5:0] y_block,
    input wire [3:0] number,      // the number to display: [0->9: ]
    input wire [3:0] color_offset, // shift through the colours
    output reg [5:0] digit_index,
    output reg [5:0] color,
    output reg [COL_INDEX_W-1:0] col_index
    );

    localparam COL_INDEX_W = $clog2(FONT_W); 

    reg [5:0] digit_index_mem [0:11];
    reg [COL_INDEX_W-1:0] col_index_mem [0:NUM_BLOCKS];
    reg [5:0] color_index_mem [0:7];

    initial begin
        /* verilator lint_off WIDTH */
        if (DIGIT_INDEX_FILE) $readmemh(DIGIT_INDEX_FILE, digit_index_mem);
        if (COL_INDEX_FILE) $readmemh(COL_INDEX_FILE, col_index_mem);
        if (COLOR_INDEX_FILE) $readmemb(COLOR_INDEX_FILE, color_index_mem);
        /* verilator lint_on WIDTH */
    end

    wire [3:0] char = x_block[5:2];
    always @(posedge clk) begin
        /* verilator lint_off WIDTH */
        digit_index <= digit_index_mem[number];
        col_index <= col_index_mem[x_block < NUM_BLOCKS ? x_block : NUM_BLOCKS-1];
        color <= color_index_mem[char + color_offset];
        /* verilator lint_on WIDTH */
    end
   
endmodule
`default_nettype wire
