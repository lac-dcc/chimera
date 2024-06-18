// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module CSR_Unit (
    input wire clk,
    input wire reset,
    input wire csr_write_enable,
    input wire [2:0] func3,
    input wire [4:0] csr_immediate,
    input wire [11:0] csr_address,
    input wire [31:0] csr_data_in,
    output reg [31:0] csr_data_out,

    // Interrupções
    input wire interruption_request_external,
    input wire interruption_request_timer,
    input wire interruption_request_software,
    input wire [15:0] interruption_request_fast,

    input wire save_pc,
    input wire [31:0] pc_value,

    output reg interrupt_on_hold
);

// Address of Machine Information CSRs

localparam MARCHID              = 12'hF12;
localparam MIMPID               = 12'hF13;

// Address of Machine Trap Setup CSRs

localparam MSTATUS              = 12'h300;
localparam MSTATUSH             = 12'h310;
localparam MISA                 = 12'h301;
localparam MIE                  = 12'h304;
localparam MTVEC                = 12'h305;

// Address of Machine Trap Handling CSRs

localparam MSCRATCH             = 12'h340;
localparam MEPC                 = 12'h341;
localparam MCAUSE               = 12'h342;
localparam MTVAL                = 12'h343;
localparam MIP                  = 12'h344;
//mpie ver esse cara


reg [31:0] csr_mcause;
reg [4:0 ] csr_mcause_code;
reg csr_mcause_interrupt_flag;
reg [31:0] csr_mepc;
wire [31:0] csr_mie;
reg [15:0] csr_mie_mfie;
reg csr_mie_meie;
reg csr_mie_msie;
reg csr_mie_mtie;
wire  [31:0] csr_mip;
reg [15:0] csr_mip_mfip;
reg csr_mip_meip;
reg csr_mip_mtip;
reg csr_mip_msip;
reg [31:0] csr_mscratch;
wire [31:0] csr_mstatus;
reg csr_mstatus_mie;
reg csr_mstatus_mpie;
reg [31:0] csr_mtvec;
reg [31:0] csr_mtval;

reg [31:0] csr_write_data;
wire [31:0] csr_input;
wire [31:0] interruption_address;

wire interrupt_pending;

//assign interruption_address = (csr_mtvec[1:0] == 2'b01 && csr_mcause_interrupt_flag) ?
//    {csr_mtvec[31:2], 2'b00} + interrupt_address_offset :
//    {csr_mtvec[31:2], 2'b00};

assign csr_input = (func3[2] == 1'b1) ? {27'h0000000, csr_immediate} : csr_data_in;

initial begin
    csr_write_data = 32'h00000000;

    csr_mcause = 32'h00000000;
    csr_mcause_code = 5'h00;
    csr_mcause_interrupt_flag = 1'b0;
    csr_mepc = 32'h00000000;
    csr_mie_mfie = 16'h0000;
    csr_mie_meie = 1'b0;
    csr_mie_msie = 1'b0;
    csr_mie_mtie = 1'b0;
    csr_mip_mfip = 32'h00000000;
    csr_mip_meip = 1'b0;
    csr_mip_mtip = 1'b0;
    csr_mip_msip = 1'b0;
    csr_mscratch = 32'h00000000;
    csr_mstatus_mie = 1'b0;
    csr_mstatus_mpie = 1'b0;
    csr_mtvec = 32'h00000000;
    csr_mtval = 32'h00000000;
    csr_write_data = 32'h00000000;
end

// verificar utime

always @(posedge clk) begin
    if(reset) begin
        csr_mie_mfie <= 16'b0;
        csr_mie_meie <= 1'b0;
        csr_mie_mtie <= 1'b0;
        csr_mie_msie <= 1'b0;
        csr_mstatus_mie   <= 1'b0;
        csr_mstatus_mpie  <= 1'b1;
        csr_mscratch <= 32'h00000000;
        csr_mcause <= 32'h00000000;
        csr_mtval <= 32'h00000000;
    end else if(interrupt_pending == 1'b1) begin 
        csr_mcause <= {csr_mcause_interrupt_flag, 26'b0, csr_mcause_code};
    end else if(csr_write_enable) begin
        case (csr_address)
            MIE: begin
                csr_mie_mfie <= csr_write_data[31:16];
                csr_mie_meie <= csr_write_data[11];
                csr_mie_mtie <= csr_write_data[7];
                csr_mie_msie <= csr_write_data[3];
            end

            MSTATUS: begin
                csr_mstatus_mie   <= csr_write_data[3];
                csr_mstatus_mpie  <= csr_write_data[7];
            end

            MSCRATCH: csr_mscratch <= csr_write_data;
            MCAUSE: csr_mcause <= csr_write_data;
            MTVAL: csr_mtval <= csr_write_data;
            MTVEC: csr_mtvec <= {csr_write_data[31:2], 1'b0, csr_write_data[0]};
            MEPC: csr_mepc <= {csr_write_data[31:2], 2'b00};
        endcase
    end
end
// verificar mcause, mepc
// Interruption


always @(posedge clk ) begin
    if(reset == 1'b1) begin
        csr_mip_mfip <= 16'h0000;
        csr_mip_meip <= 1'b0;
        csr_mip_mtip <= 1'b0;
        csr_mip_msip <= 1'b0;
    end else begin
        csr_mip_mfip <= interruption_request_fast;
        csr_mip_meip <= interruption_request_external;
        csr_mip_mtip <= interruption_request_timer;
        csr_mip_msip <= interruption_request_software;
    end
end
/*
// mcause
always @(posedge clk ) begin
    if(reset == 1'b1) begin
        csr_mcause_code           <= 5'b00000;
        csr_mcause_interrupt_flag <= 1'b0;
    end else begin
        if(interrupt_pending == 1'b1) begin
            
        end

        if(csr_mstatus_mie & csr_mie_meie & csr_mip_meip) begin
            csr_mcause_code           <= 5'b1011;
            csr_mcause_interrupt_flag <= 1'b1;
        end else if(csr_mstatus_mie & csr_mie_msie & csr_mip_msip) begin
            csr_mcause_code           <= 5'b0011;
            csr_mcause_interrupt_flag <= 1'b1;
        end else if(csr_mstatus_mie & csr_mie_mtie & csr_mip_mtip) begin
            csr_mcause_code           <= 5'b0111;
            csr_mcause_interrupt_flag <= 1'b1;
        end
    end
end
*/
always @(*) begin
    case (func3[1:0])
        2'b01: csr_write_data = csr_input;
        2'b10: csr_write_data = csr_data_out | csr_input;
        2'b11: csr_write_data = csr_data_out & ~csr_input;
        default: csr_write_data = csr_data_out;
    endcase
end
    
always @(*) begin
    case (csr_address)
        MARCHID:      csr_data_out = 32'h00000018; // RISC-V Steel microarchitecture ID
        MIMPID:       csr_data_out = 32'h00000006; // Version 6
        MSTATUS:      csr_data_out = csr_mstatus;
        MSTATUSH:     csr_data_out = 32'h00000000;
        MISA:  csr_data_out = 32'h40000100; // RV32I base ISA only
        MIE:   csr_data_out = csr_mie;
        MTVEC: csr_data_out = csr_mtvec;
        MSCRATCH:     csr_data_out = csr_mscratch;
        MEPC:  csr_data_out = csr_mepc;
        MCAUSE:       csr_data_out = csr_mcause;
        MTVAL: csr_data_out = csr_mtval;
        MIP:   csr_data_out = csr_mip;
        default:      csr_data_out = 32'h00000000;
    endcase
end

assign csr_mstatus = {
    19'h00000,
    2'b11,              // M-mode Prior Privilege (always M-mode)
    3'b000,
    csr_mstatus_mpie,   // M-mode Prior Global Interrupt Enable
    3'b000,
    csr_mstatus_mie,    // M-mode Global Interrupt Enable
    3'b000
};

assign csr_mie = {
    csr_mie_mfie,   // M-mode Designated for platform use (irq fast)
    4'b0,
    csr_mie_meie,   // M-mode External Interrupt Enable
    3'b0,
    csr_mie_mtie,   // M-mode Timer Interrupt Enable
    3'b0,
    csr_mie_msie,   // M-mode Software Interrupt Enable
    3'b0
};

assign csr_mip = {csr_mip_mfip, 4'b0, csr_mip_meip, 3'b0, csr_mip_mtip, 3'b0, csr_mip_msip, 3'b0};
assign interrupt_pending =
    (csr_mie_meie & csr_mip_meip) |
    (csr_mie_mtie & csr_mip_mtip) |
    (csr_mie_msie & csr_mip_msip) |
    (|(csr_mie_mfie & csr_mip_mfip));

endmodule
