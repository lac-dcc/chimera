module mycpu_top
(
    input  wire        clk, 
    input  wire        resetn, 
    input  wire [ 5:0] int,
    
    input  wire [31:0] inst_sram_rdata,
    output wire        inst_sram_en,
    output wire [ 3:0] inst_sram_wen,
    output wire [31:0] inst_sram_addr,
    output wire [31:0] inst_sram_wdata,
    
    input  wire [31:0] data_sram_rdata,
    output wire        data_sram_en,
    output wire [ 3:0] data_sram_wen,
    output wire [31:0] data_sram_addr,
    output wire [31:0] data_sram_wdata,
    
    output wire [31:0] debug_wb_pc,
    output wire [ 3:0] debug_wb_rf_wen,
    output wire [ 4:0] debug_wb_rf_wnum,
    output wire [31:0] debug_wb_rf_wdata
);

    wire            ibus_en;
    wire [`AddrBus] ibus_addr;
    wire [`DataBus] ibus_rdata;
    wire            ibus_streq;

    wire            dbus_en;
    wire [`AddrBus] dbus_addr;
    wire [`DataBus] dbus_rdata;
    wire [`ByteWEn] dbus_wen;
    wire [`DataBus] dbus_wdata;
    wire            dbus_streq;

    MangoMIPS_Core_Top CPU (
        .clk         (clk       ),
        .rst         (!resetn   ),
        .intr        (int       ),
        
        .ibus_en     (ibus_en   ),
        .ibus_addr   (ibus_addr ),
        .ibus_rdata  (ibus_rdata),
        .ibus_streq  (ibus_streq),
        
        .dbus_en     (dbus_en   ),
        .dbus_wen    (dbus_wen  ),
        .dbus_addr   (dbus_addr ),
        .dbus_wdata  (dbus_wdata),
        .dbus_rdata  (dbus_rdata),
        .dbus_streq  (dbus_streq),

        .debug_wb_pc     (debug_wb_pc),
        .debug_wb_wreg   (debug_wb_rf_wen),
        .debug_wb_wraddr (debug_wb_rf_wnum),
        .debug_wb_wrdata (debug_wb_rf_wdata)
    );

    assign inst_sram_en    = ibus_en;
    assign inst_sram_wen   = 4'b0;
    assign inst_sram_addr  = ibus_addr;
    assign inst_sram_wdata = 32'b0;
    
    assign data_sram_en    = dbus_en;
    assign data_sram_wen   = dbus_wen;
    assign data_sram_addr  = dbus_addr;
    assign data_sram_wdata = dbus_wdata;

    assign ibus_rdata = inst_sram_rdata;
    assign dbus_rdata = data_sram_rdata;

    reg        istate, dstate;
    reg [31:0] i_addr, d_addr;
    
    wire i_hit = ibus_addr == i_addr;
    wire d_hit = dbus_addr == d_addr;

    assign ibus_streq = ibus_en && !i_hit;
    assign dbus_streq = dbus_en && !d_hit;

    always @(posedge clk, negedge resetn) begin
        if(!resetn) begin
            istate   <= 1'b0;
            dstate   <= 1'b0;
            i_addr   <= 32'b0;
            d_addr   <= 32'b0;
        end
        else begin
            case (istate)
                1'b0: if(ibus_en && !i_hit) begin
                    istate <= 1'b1;
                    i_addr <= ibus_addr;
                end
                1'b1: begin
                    istate <= 1'b0;
                    i_addr <= 32'b0;
                end
            endcase

            case (dstate)
                1'b0: if(dbus_en && !d_hit) begin
                    dstate <= 1'b1;
                    d_addr <= dbus_addr;
                end
                1'b1: begin
                    dstate <= 1'b0;
                    d_addr <= 32'b0;
                end
            endcase
        end
    end
    
endmodule