/********************MangoMIPS32*******************
Filename :    ICache_Controller.v
Author :      RickyTino
Version :     v1.1.3
**************************************************/
`include "../Config.v"
`include "../Defines.v"

module ICache_Controller
(
    input  wire            aclk,
    input  wire            aresetn,
    output reg  [  3 : 0 ] arid,
    output reg  [ 31 : 0 ] araddr,
    output reg  [  3 : 0 ] arlen,
    output wire [  2 : 0 ] arsize,
    output wire [  1 : 0 ] arburst,
    output wire [  1 : 0 ] arlock,
    output wire [  3 : 0 ] arcache,
    output wire [  2 : 0 ] arprot,
    output reg             arvalid,
    input  wire            arready,
    input  wire [  3 : 0 ] rid,
    input  wire [ 31 : 0 ] rdata,
    input  wire [  1 : 0 ] rresp,
    input  wire            rlast,
    input  wire            rvalid,
    output wire            rready,
    output wire [  3 : 0 ] awid,
    output wire [ 31 : 0 ] awaddr,
    output wire [  3 : 0 ] awlen,
    output wire [  2 : 0 ] awsize,
    output wire [  1 : 0 ] awburst,
    output wire [  1 : 0 ] awlock,
    output wire [  3 : 0 ] awcache,
    output wire [  2 : 0 ] awprot,
    output wire            awvalid,
    input  wire            awready,
    output wire [  3 : 0 ] wid,
    output wire [ 31 : 0 ] wdata,
    output wire [  3 : 0 ] wstrb,
    output wire            wlast,
    output wire            wvalid,
    input  wire            wready,
    input  wire [  3 : 0 ] bid,
    input  wire [  1 : 0 ] bresp,
    input  wire            bvalid,
    output wire            bready,

    input  wire            bus_en,
    input  wire [`ByteWEn] bus_wen,
    input  wire [`AddrBus] bus_addr,
    output wire [`DataBus] bus_rdata,
    input  wire [`DataBus] bus_wdata,
    input  wire [`AXISize] bus_size,
    output wire            bus_streq,
    input  wire            bus_stall,
    input  wire            bus_cached,

    input  wire [`CacheOp] cacheop,
    input  wire            cop_en,
    input  wire [`AddrBus] cop_addr,
    input  wire [`DataBus] cop_itag
);

    assign arsize   = 3'b010;
    assign arburst  = 2'b01;
    assign arlock   = 2'b0;
    assign arcache  = 4'b0;
    assign arprot   = 3'b0;
    assign rready   = 1'b1;
    assign awid     = 4'b0;
    assign awaddr   = 32'b0;
    assign awlen    = 4'b0;
    assign awsize   = 3'b010;
    assign awburst  = 2'b01;
    assign awlock   = 2'b0;
    assign awcache  = 4'b0;
    assign awprot   = 3'b0;
    assign awvalid  = 1'b0;
    assign wid      = 4'b0;
    assign wdata    = 32'b0;
    assign wstrb    = 4'b0;
    assign wlast    = 1'b0;
    assign wvalid   = 1'b0;
    assign bready   = 1'b1;

    wire   cop_nop = !cacheop[0]; // See Cache Op definition
    wire   cached;

    `ifdef IF_Force_Cached
        assign cached = 1'b1;
    `else
        assign cached = bus_cached;
    `endif

    // Sync Reset
    reg ca_rstn;
    always @(posedge aclk) ca_rstn <= aresetn;

    // Cached Channel
    reg             ca_wen;
    reg  [`I_ramad] ca_adw;
    wire [`I_ramad] ca_adr;
    reg  [`DataBus] ca_din;
    wire [`DataBus] ca_dout;

    ICache_Ram icache_ram (
      .clk  (aclk   ),
      .wen  (ca_wen ),
      .adw  (ca_adw ),
      .adr  (ca_adr ),
      .din  (ca_din ),
      .dout (ca_dout)
    );

    reg  [`I_ptag] ca_ptag  [`I_lnNum];
    reg            ca_valid [`I_lnNum];

    wire [`I_idx ] ad_idx   = bus_addr[`I_addr_idx ];
    wire [`I_ptag] ad_ptag  = bus_addr[`I_addr_ptag];
    wire [`I_ptag] ln_ptag  = ca_ptag [ad_idx];
    wire           ln_valid = ca_valid[ad_idx];
    wire           ln_hit   = (ln_ptag ^ ad_ptag) == 0 && ln_valid;

    assign ca_adr  = bus_addr[`I_addr_ramad];

    //Cache Operation Channel
    wire [`I_idx ] cad_idx   = cop_addr[`I_addr_idx ];
    wire [`I_ptag] cad_ptag  = cop_addr[`I_addr_ptag];
    wire [`I_ptag] cln_ptag  = ca_ptag [cad_idx];
    wire           cln_valid = ca_valid[cad_idx];
    wire           cln_hit   = (cln_ptag ^ cad_ptag) == 0 && cln_valid;

    // Uncached Channel
    reg [`Word] uc_data;
    reg [`Word] uc_addr;
    reg         uc_valid;
    wire        uc_hit = (uc_addr ^ bus_addr) == 0 && uc_valid;

    reg r_streq;
    reg cop_streq;

    always @(*) begin
        cop_streq <= `false;
        r_streq   <= `false;

        if(bus_en) begin
            if(!cop_nop) begin
                case (cacheop)
                    `COP_III,
                    `COP_IIST,
                    `COP_IHI: cop_streq <= `true;
                endcase
            end
            else begin
                r_streq <= cached ? !ln_hit : !uc_hit;
            end
        end
    end

    assign bus_streq = r_streq || cop_streq;

    reg  [ 3 : 0] cnt;
    reg  [ 2 : 0] state;
    reg  [`Word ] lk_addr;
    reg           lk_cached;

    wire [`I_idx] lk_idx = lk_addr[`I_addr_idx];

    parameter S_IDLE                = 3'h0;
    parameter S_FILLCACHE_PREPARE   = 3'h1;
    parameter S_FILLCACHE_TRANSFER  = 3'h2;
    parameter S_FILLCACHE_END       = 3'h3;
    parameter S_UC_READ_PREPARE     = 3'h4;
    parameter S_UC_READ_TRANSFER    = 3'h5;
    parameter S_UC_READ_WAITEND     = 3'h6;

    always @(posedge aclk, negedge ca_rstn) begin
        if(!ca_rstn) begin
            state     <= 0;
            cnt       <= 0;
            lk_addr   <= `ZeroWord;
            lk_cached <= `false;

            arid     <= 0;
            araddr   <= 0;
            arlen    <= 0;
            arvalid  <= 0;

            ca_wen   <= `false;
            ca_adw   <= 0;
            ca_din   <= `ZeroWord;

            uc_data  <= `ZeroWord;
            uc_addr  <= `ZeroWord;
            uc_valid <= `false;
        end
        else begin
            arvalid  <= 0;

            ca_wen   <= `false;
            ca_adw   <= 0;
            ca_din   <= `ZeroWord;

            case (state)
                S_IDLE:  
                // if(!cop_nop) begin
                //     case (cacheop)
                //         `COP_III: ca_valid[ad_idx] <= `false;

                //         `COP_IIST: begin
                //             ca_ptag [ad_idx] <= cop_itag[`ITag_Tag];
                //             ca_valid[ad_idx] <= cop_itag[`ITag_Vld];
                //         end

                //         `COP_IHI:
                //             if(ln_hit) ca_valid[ad_idx] <= `false;
                //     endcase
                // end
                // else begin
                if(cop_nop) begin
                    if(cached) begin
                        if(bus_en && !ln_hit) begin
                            lk_addr   <= {bus_addr[31 : 6], 6'b0};
                            lk_cached <= `true;
                            cnt       <= 0;
                            state     <= S_FILLCACHE_PREPARE;
                            // ca_ptag [ad_idx] <= bus_addr[`I_addr_ptag];
                            // ca_valid[ad_idx] <= `false;
                        end
                    end
                    else begin
                        if(bus_en && !uc_hit) begin
                            lk_addr   <= bus_addr;
                            lk_cached <= `false;
                            state     <= S_UC_READ_PREPARE;
                        end
                    end
                end

                // Cache Fill
                S_FILLCACHE_PREPARE:  
                if(arvalid && arready) state <= 2;
                else begin
                    arid   <= 4'b0011;
                    araddr  <= lk_addr;
                    arlen   <= 4'hF;
                    arvalid <= `true;
                end

                 S_FILLCACHE_TRANSFER: 
                if(rvalid) begin
                    ca_wen <= `true;
                    ca_adw <= {lk_idx, cnt};
                    ca_din <= rdata;
                    cnt    <= cnt + 1;
                    if(rlast) state <= S_FILLCACHE_END;
                end

                S_FILLCACHE_END: begin
                    // ca_valid[lk_idx] <= `true;
                    state <= S_IDLE;
                end

                // Uncached Read
                S_UC_READ_PREPARE:  
                if(arvalid && arready) state <= S_UC_READ_TRANSFER;
                else begin
                    arid    <= 4'b0010;
                    araddr  <= lk_addr;
                    arlen   <= 4'h0;
                    arvalid <= `true;
                end

                S_UC_READ_TRANSFER: 
                if(rvalid) begin
                    uc_data <= rdata;
                    uc_addr <= lk_addr;
                    if(rlast) begin
                        uc_valid <= `true;
                        state    <= S_UC_READ_WAITEND;
                    end
                end

                S_UC_READ_WAITEND: begin
                    if((bus_stall ^ r_streq) == 0) begin
                        state    <= S_IDLE;
                        uc_valid <= `false;
                    end
                end
            endcase
        end
    end

    integer i;
    initial begin
        for(i = 0; i < `I_lineN; i = i + 1) begin
            ca_ptag [i] <= 0;
            ca_valid[i] <= `false;
        end
    end

    always @(posedge aclk) begin
        if(!ca_rstn) begin
            for(i = 0; i < `I_lineN; i = i + 1) begin
                ca_valid[i] <= `false;
            end
        end
        else begin
            case (state)
                S_IDLE:  
                if(!cop_nop && cop_en) begin
                    case (cacheop)
                        `COP_III: ca_valid[cad_idx] <= `false;
                        `COP_IIST: begin
                            ca_ptag [cad_idx] <= cop_itag[`ITag_Tag];
                            ca_valid[cad_idx] <= cop_itag[`ITag_Vld];
                        end
                        `COP_IHI:
                            if(cln_hit) ca_valid[cad_idx] <= `false;
                    endcase
                end
                else begin
                    if(cached) begin
                        if(bus_en && !ln_hit) begin
                            ca_ptag [ad_idx] <= bus_addr[`I_addr_ptag];
                            ca_valid[ad_idx] <= `false;
                        end
                    end
                end

                S_FILLCACHE_END: ca_valid[lk_idx] <= `true;
            endcase
        end
    end

    assign bus_rdata = cached ? ca_dout : uc_data;

endmodule