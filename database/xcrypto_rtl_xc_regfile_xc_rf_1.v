

//
// module: xc_regfile
//
//  A 3-read-1-write register file
//
module xc_rf_1 (

input  wire        clock      ,
input  wire        resetn     ,
           
input  wire [ 4:0] rs1_addr   ,
output wire [31:0] rs1_rdata  ,
           
input  wire [ 4:0] rs2_addr   ,
output wire [31:0] rs2_rdata  ,

input  wire [ 4:0] rs3_addr   ,
output wire [31:0] rs3_rdata  ,
           
input  wire        rd_wen     ,
input  wire [ 4:0] rd_addr    ,
input  wire [31:0] rd_wdata    

);

reg [31:0] gprs [31:0];

assign rs1_rdata = gprs[rs1_addr];
assign rs2_rdata = gprs[rs2_addr];
assign rs3_rdata = gprs[rs3_addr];

genvar i = 0;
generate for(i = 0; i < 32; i ++) begin

    if(i == 0) begin

        always @(*) gprs[i] = 0;

    end else begin

        always @(posedge clock) if(rd_wen && rd_addr == i) begin

            gprs[i] <= rd_wdata;

        end

    end

end endgenerate

endmodule

