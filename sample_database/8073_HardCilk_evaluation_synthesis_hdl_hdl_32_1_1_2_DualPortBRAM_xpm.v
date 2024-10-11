// This program was cloned from: https://github.com/Mahfouz-z/HardCilk
// License: GNU General Public License v3.0

// xpm_memory_tdpram: True Dual Port RAM
// Xilinx Parameterized Macro, version 2022.2


module DualPortBRAM #(
    parameter DATA = 32,
    parameter ADDR = 6
) (
    input   wire               clk,
    input   wire               rst,
    // Port A
    input   wire                a_wr,
    input   wire    [ADDR-1:0]  a_addr,
    input   wire    [DATA-1:0]  a_din,
    output  wire    [DATA-1:0]  a_dout,

    // Port B
    input   wire                b_wr,
    input   wire    [ADDR-1:0]  b_addr,
    input   wire    [DATA-1:0]  b_din,
    output  wire    [DATA-1:0]  b_dout
);

    wire en;
    assign en = 1'b1;
    xpm_memory_tdpram #(
   .ADDR_WIDTH_A(ADDR),               // DECIMAL
   .ADDR_WIDTH_B(ADDR),               // DECIMAL
   .AUTO_SLEEP_TIME(0),            // DECIMAL
   .BYTE_WRITE_WIDTH_A(DATA),        // DECIMAL
   .BYTE_WRITE_WIDTH_B(DATA),        // DECIMAL
   .CASCADE_HEIGHT(0),             // DECIMAL
   .CLOCKING_MODE("common_clock"), // String
   .ECC_MODE("no_ecc"),            // String
   .MEMORY_INIT_FILE("none"),      // String
   .MEMORY_INIT_PARAM("0"),        // String
   .MEMORY_OPTIMIZATION("true"),   // String
   .MEMORY_PRIMITIVE("bram"),      // String
   .MEMORY_SIZE((2**ADDR) * 32),             // DECIMAL, Number of words * 32 to get number of bits
   .MESSAGE_CONTROL(0),            // DECIMAL
   .READ_DATA_WIDTH_A(DATA),       // DECIMAL
   .READ_DATA_WIDTH_B(DATA),       // DECIMAL
   .READ_LATENCY_A(1),             // DECIMAL
   .READ_LATENCY_B(1),             // DECIMAL
   .READ_RESET_VALUE_A("0"),       // String
   .READ_RESET_VALUE_B("0"),       // String
   .RST_MODE_A("SYNC"),            // String
   .RST_MODE_B("SYNC"),            // String
   .SIM_ASSERT_CHK(1),             // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
   .USE_EMBEDDED_CONSTRAINT(0),    // DECIMAL
   .USE_MEM_INIT(1),               // DECIMAL
   .USE_MEM_INIT_MMI(0),           // DECIMAL
   .WAKEUP_TIME("disable_sleep"),  // String
   .WRITE_DATA_WIDTH_A(DATA),      // DECIMAL
   .WRITE_DATA_WIDTH_B(DATA),      // DECIMAL
   .WRITE_MODE_A("no_change"),     // String
   .WRITE_MODE_B("no_change"),    // String
   .WRITE_PROTECT(0)               // DECIMAL
)
    xpm_memory_tdpram_inst (


    .douta(a_dout),                   // READ_DATA_WIDTH_A-bit output: Data output for port A read operations.
    .clka(clk),                      // 1-bit input: Clock signal for port A. Also clocks port B when
    .addra(a_addr),                   // ADDR_WIDTH_A-bit input: Address for port A write and read operations.
    .dina(a_din),                     // WRITE_DATA_WIDTH_A-bit input: Data input for port A write operations.
    .wea(a_wr),                       // WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A-bit input: Write enable vector
                                        // for port A input data port dina. 1 bit wide when word-wide writes are
                                        // used. In byte-wide write configurations, each bit controls the
                                        // writing one byte of dina to address addra. For example, to
                                        // synchronously write only bits [15-8] of dina when WRITE_DATA_WIDTH_A
                                        // is 32, wea would be 4'b0010.


    .doutb(b_dout),                  // READ_DATA_WIDTH_B-bit output: Data output for port B read operations.
    .clkb(clk),                     // 1-bit input: Clock signal for port B when parameter CLOCKING_MODE is
                                        // "independent_clock". Unused when parameter CLOCKING_MODE is
                                        // "common_clock".
    .addrb(b_addr),                  // ADDR_WIDTH_B-bit input: Address for port B write and read operations.
                                        // parameter CLOCKING_MODE is "common_clock".
    .dinb(b_din),                     // WRITE_DATA_WIDTH_B-bit input: Data input for port B write operations.
    .web(b_wr),                        // WRITE_DATA_WIDTH_B/BYTE_WRITE_WIDTH_B-bit input: Write enable vector
                                    // for port B input data port dinb. 1 bit wide when word-wide writes are
                                    // used. In byte-wide write configurations, each bit controls the
                                    // writing one byte of dinb to address addrb. For example, to
                                    // synchronously write only bits [15-8] of dinb when WRITE_DATA_WIDTH_B
                                    // is 32, web would be 4'b0010.



    .rsta(rst),                     // 1-bit input: Reset signal for the final port A output register stage.
                                        // Synchronously resets output port douta to the value specified by
                                        // parameter READ_RESET_VALUE_A.
    .rstb(rst),                     // 1-bit input: Reset signal for the final port B output register stage.
                                        // Synchronously resets output port doutb to the value specified by
                                        // parameter READ_RESET_VALUE_B.


    .ena(en),                       // 1-bit input: Memory enable signal for port A. Must be high on clock
                                        // cycles when read or write operations are initiated. Pipelined
                                        // internally.
    .enb(en),                       // 1-bit input: Memory enable signal for port B. Must be high on clock
                                        // cycles when read or write operations are initiated. Pipelined
                                        // internally.

    .regcea(en),                 // 1-bit input: Clock Enable for the last register stage on the output
                                        // data path.
    .regceb(en),                 // 1-bit input: Clock Enable for the last register stage on the output
                                        // data path.

    .sleep(0)                       // 1-bit input: sleep signal to enable the dynamic power saving feature.
    );

endmodule
// End of xpm_memory_tdpram_inst instantiation// This program was cloned from: https://github.com/EPFL-LAP/HardCilk
// License: GNU General Public License v3.0

// xpm_memory_tdpram: True Dual Port RAM
// Xilinx Parameterized Macro, version 2022.2


module DualPortBRAM #(
    parameter DATA = 32,
    parameter ADDR = 6
) (
    input   wire               clk,
    input   wire               rst,
    // Port A
    input   wire                a_wr,
    input   wire    [ADDR-1:0]  a_addr,
    input   wire    [DATA-1:0]  a_din,
    output  wire    [DATA-1:0]  a_dout,

    // Port B
    input   wire                b_wr,
    input   wire    [ADDR-1:0]  b_addr,
    input   wire    [DATA-1:0]  b_din,
    output  wire    [DATA-1:0]  b_dout
);

    wire en;
    assign en = 1'b1;
    xpm_memory_tdpram #(
   .ADDR_WIDTH_A(ADDR),               // DECIMAL
   .ADDR_WIDTH_B(ADDR),               // DECIMAL
   .AUTO_SLEEP_TIME(0),            // DECIMAL
   .BYTE_WRITE_WIDTH_A(DATA),        // DECIMAL
   .BYTE_WRITE_WIDTH_B(DATA),        // DECIMAL
   .CASCADE_HEIGHT(0),             // DECIMAL
   .CLOCKING_MODE("common_clock"), // String
   .ECC_MODE("no_ecc"),            // String
   .MEMORY_INIT_FILE("none"),      // String
   .MEMORY_INIT_PARAM("0"),        // String
   .MEMORY_OPTIMIZATION("true"),   // String
   .MEMORY_PRIMITIVE("bram"),      // String
   .MEMORY_SIZE((2**ADDR) * 32),             // DECIMAL, Number of words * 32 to get number of bits
   .MESSAGE_CONTROL(0),            // DECIMAL
   .READ_DATA_WIDTH_A(DATA),       // DECIMAL
   .READ_DATA_WIDTH_B(DATA),       // DECIMAL
   .READ_LATENCY_A(1),             // DECIMAL
   .READ_LATENCY_B(1),             // DECIMAL
   .READ_RESET_VALUE_A("0"),       // String
   .READ_RESET_VALUE_B("0"),       // String
   .RST_MODE_A("SYNC"),            // String
   .RST_MODE_B("SYNC"),            // String
   .SIM_ASSERT_CHK(1),             // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
   .USE_EMBEDDED_CONSTRAINT(0),    // DECIMAL
   .USE_MEM_INIT(1),               // DECIMAL
   .USE_MEM_INIT_MMI(0),           // DECIMAL
   .WAKEUP_TIME("disable_sleep"),  // String
   .WRITE_DATA_WIDTH_A(DATA),      // DECIMAL
   .WRITE_DATA_WIDTH_B(DATA),      // DECIMAL
   .WRITE_MODE_A("no_change"),     // String
   .WRITE_MODE_B("no_change"),    // String
   .WRITE_PROTECT(0)               // DECIMAL
)
    xpm_memory_tdpram_inst (


    .douta(a_dout),                   // READ_DATA_WIDTH_A-bit output: Data output for port A read operations.
    .clka(clk),                      // 1-bit input: Clock signal for port A. Also clocks port B when
    .addra(a_addr),                   // ADDR_WIDTH_A-bit input: Address for port A write and read operations.
    .dina(a_din),                     // WRITE_DATA_WIDTH_A-bit input: Data input for port A write operations.
    .wea(a_wr),                       // WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A-bit input: Write enable vector
                                        // for port A input data port dina. 1 bit wide when word-wide writes are
                                        // used. In byte-wide write configurations, each bit controls the
                                        // writing one byte of dina to address addra. For example, to
                                        // synchronously write only bits [15-8] of dina when WRITE_DATA_WIDTH_A
                                        // is 32, wea would be 4'b0010.


    .doutb(b_dout),                  // READ_DATA_WIDTH_B-bit output: Data output for port B read operations.
    .clkb(clk),                     // 1-bit input: Clock signal for port B when parameter CLOCKING_MODE is
                                        // "independent_clock". Unused when parameter CLOCKING_MODE is
                                        // "common_clock".
    .addrb(b_addr),                  // ADDR_WIDTH_B-bit input: Address for port B write and read operations.
                                        // parameter CLOCKING_MODE is "common_clock".
    .dinb(b_din),                     // WRITE_DATA_WIDTH_B-bit input: Data input for port B write operations.
    .web(b_wr),                        // WRITE_DATA_WIDTH_B/BYTE_WRITE_WIDTH_B-bit input: Write enable vector
                                    // for port B input data port dinb. 1 bit wide when word-wide writes are
                                    // used. In byte-wide write configurations, each bit controls the
                                    // writing one byte of dinb to address addrb. For example, to
                                    // synchronously write only bits [15-8] of dinb when WRITE_DATA_WIDTH_B
                                    // is 32, web would be 4'b0010.



    .rsta(rst),                     // 1-bit input: Reset signal for the final port A output register stage.
                                        // Synchronously resets output port douta to the value specified by
                                        // parameter READ_RESET_VALUE_A.
    .rstb(rst),                     // 1-bit input: Reset signal for the final port B output register stage.
                                        // Synchronously resets output port doutb to the value specified by
                                        // parameter READ_RESET_VALUE_B.


    .ena(en),                       // 1-bit input: Memory enable signal for port A. Must be high on clock
                                        // cycles when read or write operations are initiated. Pipelined
                                        // internally.
    .enb(en),                       // 1-bit input: Memory enable signal for port B. Must be high on clock
                                        // cycles when read or write operations are initiated. Pipelined
                                        // internally.

    .regcea(en),                 // 1-bit input: Clock Enable for the last register stage on the output
                                        // data path.
    .regceb(en),                 // 1-bit input: Clock Enable for the last register stage on the output
                                        // data path.

    .sleep(0)                       // 1-bit input: sleep signal to enable the dynamic power saving feature.
    );

endmodule
// End of xpm_memory_tdpram_inst instantiation