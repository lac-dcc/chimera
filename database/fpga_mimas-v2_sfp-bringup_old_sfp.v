// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module sfp(rx, tx, detect, los, fault, shutdown, sda, scl, clk, enable);
    // SFP IO
    input   rx;         // Receive data
    output  tx;         // Transmit data
    input   detect;     // Detect module presence
    input   los;        // Loss of signal
    input   fault;      // Transmitter fault
    output  shutdown;   // Transmitter shutdown
    inout   sda;        // DOM data line
    output  scl;        // DOM clock line

    // FPGA IO
    input   clk;        // Global clock
    input   enable;     // Enable SFP module

    reg r_rx;
    reg r_detect;
    reg r_los;
    reg r_fault;

    always @(posedge clk) begin
        r_rx        <= rx;
        r_detect    <= detect;
        r_los       <= los;
        r_fault     <= fault;
    end


    assign shutdown = ~enable;
    assign tx = 1'b0;

    // Disable I²C interface
    assign sda = 1'b0;
    assign scl = 1'b0;
endmodule
