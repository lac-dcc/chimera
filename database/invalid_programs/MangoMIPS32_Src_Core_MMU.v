/********************MangoMIPS32*******************
Filename:   MMU.v
Author:     RickyTino
Version:    v1.1.3
**************************************************/
`include "../Config.v"
`include "../Defines.v"

module MMU
(   
    input  wire            en,
    input  wire [`ByteWEn] wen,
    input  wire [`AddrBus] vaddr,
    input  wire [`DataBus] wdata,
    output wire [`DataBus] rdata,
    input  wire [`AXISize] size,
    output wire            refs,

    output reg             bus_en,
    output wire [`ByteWEn] bus_wen,
    output reg  [`AddrBus] bus_paddr,
    output wire [`DataBus] bus_wdata,
    input  wire [`DataBus] bus_rdata,
    output wire [`AXISize] bus_size,
    input  wire            bus_streq,
    output reg             bus_cached,

    output reg             tlb_en,
    output reg  [`AddrBus] tlb_vaddr,
    // output reg             tlb_refs,
    input  wire            tlb_rdy,
    input  wire [`AddrBus] tlb_paddr,
    input  wire            tlb_cat,
    input  wire            tlb_tlbr,
    input  wire            tlb_tlbi,
    input  wire            tlb_tlbm,

    input  wire            exc_flag,
    input  wire [`DataBus] cp0_Status,
    input  wire [`DataBus] cp0_Config,
    output reg             exc_tlbr,
    output reg             exc_tlbi,
    output reg             exc_tlbm,

    output wire            stallreq
);

`ifdef Fixed_Mapping_MMU

    assign bus_wen   = en ? wen : `WrDisable;
    assign bus_wdata = wdata;
    assign bus_size  = size;
    assign rdata     = en ? bus_rdata : `ZeroWord;
    assign refs      = wen != `WrDisable;
    assign stallreq  = bus_streq;

    always @(*) begin
        exc_tlbr   <= `false;
        exc_tlbi   <= `false;
        exc_tlbm   <= `false;

        bus_en     <= en && !exc_flag;
        case (vaddr[`Seg])
            `kseg0: begin  // kseg0: unmapped
                bus_paddr  <= {3'b000, vaddr[28:0]};
                bus_cached <= cp0_Config[`K0] == 3'd3;
            end
            
            `kseg1: begin // kseg1: unmapped, uncached
                bus_paddr  <= {3'b000, vaddr[28:0]};
                bus_cached <= `false;
            end
            
            `kseg2, `kseg3: begin // kseg2 & kseg3: mapped
                bus_paddr  <= vaddr;
                bus_cached <= cp0_Config[`K23] == 3'd3;
            end

            default: begin // kuseg: mapped
                bus_paddr  <= cp0_Status[`ERL] ? vaddr : {vaddr[31:28] + 4'd4, vaddr[27:0]};
                bus_cached <= cp0_Config[`KU] == 3'd3;
            end
        endcase
    end

`else // TLB-based MMU

    reg  tlb_streq;

    assign bus_wen   = en ? wen : `WrDisable;
    assign bus_wdata = wdata;
    assign bus_size  = size;
    assign rdata     = en ? bus_rdata : `ZeroWord;
    assign refs      = wen != `WrDisable;
    assign stallreq  = bus_streq || tlb_streq;

    always @(*) begin
        tlb_en     <= `false;
        tlb_vaddr  <= `ZeroWord;
        // tlb_refs   <= `false;
        tlb_streq  <= `false;
        bus_en     <= `false;
        bus_paddr  <= `ZeroWord;
        bus_cached <= `false;
        exc_tlbr   <= `false;
        exc_tlbi   <= `false;
        exc_tlbm   <= `false;

        // if(en && !exc_flag) begin
        case (vaddr[`Seg])
            `kseg0: begin // kseg0: unmapped
                bus_paddr  <= {3'b000, vaddr[28:0]};
                bus_en     <= en && !exc_flag;
                bus_cached <= cp0_Config[`K0] == 3'd3;
            end
            
            `kseg1: begin // kseg1: unmapped, uncached
                bus_paddr  <= {3'b000, vaddr[28:0]};
                bus_en     <= en && !exc_flag;
                bus_cached <= `false;
            end
            
            default: begin // kseg2, kseg3, kuseg: mapped
                if(cp0_Status[`ERL]) begin
                    bus_paddr  <= {3'b000, vaddr[28:0]};
                    bus_en     <= en && !exc_flag;
                    bus_cached <= `false;
                end
                else if(en) begin
                    tlb_en     <= `true;
                    // tlb_refs   <= wen != `WrDisable;
                    tlb_vaddr  <= vaddr;
                    tlb_streq  <= !tlb_rdy;
                    bus_paddr  <= tlb_paddr;
                    bus_en     <= tlb_rdy & !exc_flag;
                    bus_cached <= tlb_cat;
                    exc_tlbr   <= tlb_tlbr;
                    exc_tlbi   <= tlb_tlbi;
                    exc_tlbm   <= tlb_tlbm;
                end
            end
        endcase
    end
`endif

endmodule