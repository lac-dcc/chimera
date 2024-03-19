
module b222 (BCLK, WR_MRAM, VADR, MMU_DIN, rd_addr, rd_result);

input                   BCLK;
input			WR_MRAM;
input   [31:0]		VADR;
input  [23:0]		MMU_DIN;
input  [1:0]		rd_addr;
output [35:0]		rd_result;

reg             [31:0]  VADR_R;
reg             [35:0]  MMU_TAGS [0:3];

    always @(posedge BCLK) VADR_R <= VADR;

    always @(negedge BCLK) if (WR_MRAM) MMU_TAGS[VADR_R[19:18]] <= {VADR_R[31:20],MMU_DIN[23:0]};

    assign rd_result = MMU_TAGS[rd_addr];

endmodule

