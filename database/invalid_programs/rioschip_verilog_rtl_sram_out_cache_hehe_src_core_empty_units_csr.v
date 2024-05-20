// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

`ifndef CSR_V
`define CSR_V

`include "../params.vh"

module csr #(
   XLEN = 64,
   EXCEPTION_CODE_WIDTH = 4,
   VIRTUAL_ADDR_LEN = 32
) (
    input clk,
    input reset,

    // from interupt controller
    input meip,

    // from decode (read port)
    input [11:0] read_address,
    // to decode (read port)
    output reg [XLEN - 1:0] read_data,
    output reg readable,
    output reg writeable,

    // from rcu
    input write_enable,
    input [11:0] write_address,
    input [XLEN - 1:0] write_data,
    
    // from exception ctrl
    input retired,
    input traped,
    input mret,
    input [VIRTUAL_ADDR_LEN-1:0] ecp,
    input [EXCEPTION_CODE_WIDTH - 1:0] trap_cause,
    input interupt,     

    // to exception ctrl
    output eip,
    output tip,
    output sip,

    // to fetch
    output [VIRTUAL_ADDR_LEN-1:0] trap_vector, // mtvec内的异常处理程序的地址
    output [VIRTUAL_ADDR_LEN-1:0] mret_vector // mepc内的原pc
);

reg [XLEN - 1:0] cycle = 0;
reg [XLEN - 1:0] instret = 0;
reg pie = 0;
reg ie = 0;
reg meie;
reg msie;
reg msip;
reg mtie;
reg mtip;
reg [XLEN - 1:0] mtvec;
reg [XLEN - 1:0] mscratch;
reg [VIRTUAL_ADDR_LEN - 1:0] mepc;
reg [EXCEPTION_CODE_WIDTH - 1:0] mcause = 0;
reg minterupt = 0;

// This is a custom csr
reg [XLEN - 1:0] mtimecmp;

assign eip = ie && meie && meip;
assign tip = ie && mtie && mtip;
assign sip = ie && msie && msip;

assign trap_vector = mtvec[31:0];
assign mret_vector = mepc;

always @(*) begin
    casez (read_address)
        12'hc00, 12'hc01: begin // cycle, time
            read_data = cycle;
            readable = 1;
            writeable = 0;
        end
        12'hc02: begin // instret
            read_data = instret;
            readable = 1;
            writeable = 0;
        end
        // 12'hc80, 12'hc81: begin // cycleh, timeh
        //     read_data = cycle[XLEN - 1:32];
        //     readable = 1;
        //     writeable = 0;
        // end
        // 12'hc82: begin // instreth
        //     read_data = instret[XLEN - 1:32];
        //     readable = 1;
        //     writeable = 0;
        // end
        // ? casez中？表示该位并不关心
        12'hc03, 12'hc04, 12'hc05, 12'hc06, 12'hc07, 12'hc08, 12'hc09, 12'hc0a, 12'hc0b, 12'hc0c, 12'hc0d, 12'hc0e, 12'hc0f, 12'hc1?,
        12'hc83, 12'hc84, 12'hc85, 12'hc86, 12'hc87, 12'hc88, 12'hc89, 12'hc8a, 12'hc8b, 12'hc8c, 12'hc8d, 12'hc8e, 12'hc8f, 12'hc80, 12'hc81, 12'hc82,
        12'hc9?: begin // hpmcounterX, hpmcounterXh
            read_data = 0;
            readable = 1;
            writeable = 0;
        end
        12'hf11, 12'hf12, 12'hf13, 12'hf14: begin // mvendorid, marchid, mimpid, mhartid
            read_data = 0;
            readable = 1;
            writeable = 0;
        end
        12'h300: begin // mstatus
            //             SD  WPRI   MBE    SBE   SXL   UXL   WPRI  TSR   TW   TVM   MXR   SUM  MPRV    XS    FS    MPP   VS    SPP  MPIE   UBE  SPIE  WPRI MIE WPRI   SIE  WPRI
            read_data = {1'b0, 25'b0, 1'b0, 1'b0, 2'b0, 2'b10, 9'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 2'b0, 2'b0, 2'b0, 2'b0, 1'b0, pie, 1'b0, 1'b0, 1'b0, ie, 1'b0, 1'b0, 1'b0};
            readable = 1;
            writeable = 1;
        end
        12'h301: begin // misa
            //            MXL    WLRL      ZYXWVUTSRQPONMLKJIHGFEDCBA
            read_data = {2'b10, 36'b0, 26'b00000000000000000100000000};
            readable = 1;
            writeable = 1;
        end
        12'h344: begin // mip
            //            WPRI  MEIP  WPRI  SEIP  UEIP  MTIP  WPRI  STIP  UTIP  MSIP  WPRI  SSIP  USIP
            read_data = {52'b0, meip, 1'b0, 1'b0, 1'b0, mtip, 1'b0, 1'b0, 1'b0, msip, 1'b0, 1'b0, 1'b0};
            readable = 1;
            writeable = 1;
        end
        12'h304: begin // mie
            //            WPRI  MEIE  WPRI  SEIE  UEIE  MTIE  WPRI  STIE  UTIE  MSIE  WPRI  SSIE  USIE
            read_data = {52'b0, meie, 1'b0, 1'b0, 1'b0, mtie, 1'b0, 1'b0, 1'b0, msie, 1'b0, 1'b0, 1'b0};
            readable = 1;
            writeable = 1;
        end
        12'h305: begin // mtvec
            read_data = {mtvec[XLEN - 1:2], 2'b00};
            readable = 1;
            writeable = 1;
        end
        12'h340: begin // mscratch
            read_data = mscratch;
            readable = 1;
            writeable = 1;
        end
        12'h341: begin // mepc
            read_data = {32'b0, mepc};
            readable = 1;
            writeable = 1;
        end
        12'h342: begin // mcause
            read_data = {minterupt, 59'b0, mcause};
            readable = 1;
            writeable = 1;
        end
        12'h343: begin // mtval
            read_data = 0;
            readable = 1;
            writeable = 1;
        end
        12'hb00, 12'hb01: begin // mcycle, mtime
            read_data = cycle;
            readable = 1;
            writeable = 1;
        end
        12'hb02: begin // minstret
            read_data = instret;
            readable = 1;
            writeable = 1;
        end
        // 12'hb80, 12'hb81: begin // mcycleh, mtimeh
        //     read_data = cycle[XLEN - 1:32];
        //     readable = 1;
        //     writeable = 1;
        // end
        // 12'hb82: begin // minstreth
        //     read_data = instret[XLEN - 1:32];
        //     readable = 1;
        //     writeable = 1;
        // end
        12'hb03, 12'hb04, 12'hb05, 12'hb06, 12'hb07, 12'hb08, 12'hb09, 12'hb0a, 12'hb0b, 12'hb0c, 12'hb0d, 12'hb0e, 12'hb0f, 12'hb1?,
        12'hb83, 12'hb84, 12'hb85, 12'hb86, 12'hb87, 12'hb88, 12'hb89, 12'hb8a, 12'hb8b, 12'hb8c, 12'hb8d, 12'hb8e, 12'hb8f, 12'hb80, 12'hb81, 12'hb82, 12'hbc1,
        12'hb9?: begin // mhpmcounterX, mhpmcounterXh
            read_data = 0;
            readable = 1;
            writeable = 1;
        end
        12'h32?, 12'h33?: begin // mhpmeventX
            read_data = 0;
            readable = 1;
            writeable = 1;
        end
        // Custom CSRs
        12'hbc0: begin // mtimecmp - This csr is not memory mapped as defined by the riscv spec
            read_data = mtimecmp;
            readable = 1;
            writeable = 1;
        end
        // 12'hbc1: begin // mtimecmph
        //     read_data = mtimecmp;
        //     readable = 1;
        //     writeable = 1;
        // end
        default: begin
            read_data = 0;
            readable = 0;
            writeable = 0;
        end
    endcase
end

always @(posedge clk) begin
    if (traped) begin
        pie <= ie;
        ie <= 0;
        mepc <= ecp;
        minterupt <= interupt;
        mcause <= trap_cause;
    end else if (mret) begin
        ie <= pie;
        pie <= 1;
    end
    cycle <= cycle + 1;
    if (retired) begin
        instret <= instret + 1;
    end
    if (write_enable) begin
        casez (write_address)
            12'h300: begin // mstatus
                ie <= write_data[3];
                pie <= write_data[7];
            end
            12'h344: begin // mip
                msip <= write_data[3];
            end
            12'h304: begin // mie
                msie <= write_data[3];
                mtie <= write_data[7];
                meie <= write_data[11];
            end
            12'h305: begin // mtvec
                mtvec <= {write_data[XLEN - 1:2], 2'b00};
            end
            12'h340: begin // mscratch
                mscratch <= write_data;
            end
            12'h341: begin // mepc
                mepc <= write_data[VIRTUAL_ADDR_LEN-1:0];
            end
            12'h342: begin // mcause
                minterupt <= write_data[XLEN - 1];
                mcause <= write_data[3:0];
            end
            12'hb00, 12'hb01: begin // mcycle, mtime
                cycle[XLEN - 1:0] <= write_data;
            end
            12'hb02: begin // minstret
                instret[XLEN - 1:0] <= write_data;
            end
            // 12'hb80, 12'hb81: begin // mcycleh, mtimeh
            //     cycle[XLEN - 1:32] <= write_data;
            // end
            // 12'hb82: begin // minstreth
            //     instret[XLEN - 1:32] <= write_data;
            // end
            // Custom CSRs
            12'hbc0: begin // mtimecmp - This csr is not memory mapped as defined by the riscv spec
                mtimecmp[XLEN - 1:0] <= write_data;
            end
            // 12'hbc1: begin // mtimecmph
            //     mtimecmp[XLEN - 1:32] <= write_data;
            // end
            default: begin
            end
        endcase
    end
    if (reset) begin
        ie <= 0;
        pie <= 0;
        mcause <= 0;
        minterupt <= 0;
        cycle <= 0;
        instret <= 0;
    end
    mtip <= cycle >= mtimecmp;
end
// CSR_V
endmodule
`endif 
