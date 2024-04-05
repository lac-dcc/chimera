/********************MangoMIPS32*******************
Filename:   RegFile.v
Author:     RickyTino
Version:    v1.1.3
**************************************************/
`include "../Config.v"
`include "../Defines.v"

module RegFile
(
    input  wire            clk,
    input  wire            rst, 

    input  wire            re1, 
    input  wire [`RegAddr] r1addr,
    output reg  [`DataBus] r1data,

    input  wire            re2,
    input  wire [`RegAddr] r2addr,
    output reg  [`DataBus] r2data,

    input  wire [`ByteWEn] we,
    input  wire [`RegAddr] waddr, 
    input  wire [`DataBus] wdata,

    input  wire [`ByteWEn] ex_wreg,
    input  wire [`RegAddr] ex_wraddr,
    input  wire [`DataBus] ex_alures,
    input  wire [`ByteWEn] mem_wreg,
    input  wire [`RegAddr] mem_wraddr,
    input  wire [`DataBus] mem_alures,

    output wire            hazard_ex,
    output wire            hazard_mem
);

    reg [`Word] GPR [0:31];
    integer j;
    
    initial begin
        for(j = 0; j < 32; j = j + 1)
            GPR[j] <= `ZeroWord;
    end

    always @(posedge clk) begin
        if(waddr != `ZeroReg) begin
            if(we[0]) GPR[waddr][`Byte0] <= wdata[`Byte0];
            if(we[1]) GPR[waddr][`Byte1] <= wdata[`Byte1];
            if(we[2]) GPR[waddr][`Byte2] <= wdata[`Byte2];
            if(we[3]) GPR[waddr][`Byte3] <= wdata[`Byte3];
        end
    end

    wire            r1_rvalid  = re1      &&   (r1addr != `ZeroReg);
    wire [`ByteWEn] r1_ex_haz  = ex_wreg  & {4{(r1addr ^ ex_wraddr)  == 0}};
    wire [`ByteWEn] r1_mem_haz = mem_wreg & {4{(r1addr ^ mem_wraddr) == 0}};
    wire [`ByteWEn] r1_wb_haz  = we       & {4{(r1addr ^ waddr)      == 0}};
    
    wire            r2_rvalid  = re2      &&   (r2addr != `ZeroReg);
    wire [`ByteWEn] r2_ex_haz  = ex_wreg  & {4{(r2addr ^ ex_wraddr)  == 0}};
    wire [`ByteWEn] r2_mem_haz = mem_wreg & {4{(r2addr ^ mem_wraddr) == 0}};
    wire [`ByteWEn] r2_wb_haz  = we       & {4{(r2addr ^ waddr)      == 0}};
    
    `define  ByteI  8*i+7 : 8*i
    
    genvar i;
    generate
        for(i = 0; i < 4; i = i + 1) begin
            always @(*) begin
                casez ({r1_rvalid, r1_ex_haz[i], r1_mem_haz[i], r1_wb_haz[i]})
                    4'b0???: r1data[`ByteI] <= `ZeroByte;
                    4'b11??: r1data[`ByteI] <= ex_alures  [`ByteI];
                    4'b101?: r1data[`ByteI] <= mem_alures [`ByteI];
                    4'b1001: r1data[`ByteI] <= wdata      [`ByteI];
                    default: r1data[`ByteI] <= GPR[r1addr][`ByteI];
                endcase
                
                casez ({r2_rvalid, r2_ex_haz[i], r2_mem_haz[i], r2_wb_haz[i]})
                    4'b0???: r2data[`ByteI] <= `ZeroByte;
                    4'b11??: r2data[`ByteI] <= ex_alures  [`ByteI];
                    4'b101?: r2data[`ByteI] <= mem_alures [`ByteI];
                    4'b1001: r2data[`ByteI] <= wdata      [`ByteI];
                    default: r2data[`ByteI] <= GPR[r2addr][`ByteI];
                endcase
            end
        end
    endgenerate
    
    assign hazard_ex  = ((r1_ex_haz  != `WrDisable) && r1_rvalid) || 
                        ((r2_ex_haz  != `WrDisable) && r2_rvalid);
    assign hazard_mem = ((r1_mem_haz != `WrDisable) && r1_rvalid) || 
                        ((r2_mem_haz != `WrDisable) && r2_rvalid);

endmodule