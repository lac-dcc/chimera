// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// AM29833A
// PARITY BUS TRANSCEIVERS
// Documentation: https://pdf1.alldatasheet.com/datasheet-pdf/view/165880/AMD/AM29833A.html

// Used on 3202D - Sheet 46 - MEM_DATA

/*
GENERAL DESCRIPTION 
The Am29833A and Am29853A are high-performance parity bus transceivers designed for two-way communications. 
Each device can be used as an 8-bit transceiver, as well as a 9-bit parity checker/generator. 

In the transmit mode, data is read at the R port and output at the T port with a parity bit. 
In the receive mode, data and parity are read at the T port, and the data is output at the R port along with an /ERR flag showing the result of the parity test. 

In the Am29833A, the error flag is clocked and stored in a register which is read at the open-collector ERR out-put. 

The /CLR input is used to clear the error flag register. 

In the Am29853A, a latch replaces this register, and the /EN and /CLR controls are used to pass, store, sample or clear the error flag output.
When both output enables are disabled in the Am29853A and Am29833A, the  parity logic defaults to the transmit mode, so that the ERR pin reflects the parity of the R port. 

The output enables, /OER and /OET, are used to force the port outputs to the high-impedance state so that other devices can drive bus lines directly. 
In addition, the user can force a parity error by enabling both OER and OET simultaneously. 

This transmission of inverted parity gives the designer more system diagnostic capability. 
Each of these devices is produced with AMD's proprietary IMOX bipolar process, and features typical propagation delays of 6 ns, as well as high-capacitive drive capability. 

*/


module AM29833A( input  wire CLK,
                 input  wire CLR_n,
                 output wire ERR_n,
                 input  wire OER_n,
                 input  wire OET_n,
                 input  wire PAR, // Parity bit (in)
                 output wire PAR_OUT,  // Parity bit (out)
                 input  wire [7:0] R,
                 output wire [7:0] R_OUT,
                 input  wire [7:0] T,
                 output wire [7:0] T_OUT
);



    // Declare internal wires
    wire [7:0] mux_out;
    wire [8:0] parity_input;
    wire parity_output;
    wire error_flag;

    // Sequential logic for registers
    reg [7:0] reg_R;
    reg [7:0] reg_T;



 always @(posedge CLK or negedge CLR_n) begin
        if (!CLR_n) begin
            // Reset logic
            reg_R <= 8'b0;
            reg_T <= 8'b0;
        end else begin
            // Update registers with input
            reg_R <= R;
            reg_T <= T;            
        end
end


assign R_OUT = (CLR_n & !OET_n & OER_n) ? reg_T : 8'b0;  // RECEIVE MODE (Transmits data from T port to R port with parity test resulting in error flag. Transmit path is disabled.)
assign T_OUT = (CLR_n & OET_n & !OER_n) ? reg_R : 8'b0;  // TRANSMIT MODE (Transmits data from R port to T port, generating parity. Receive path is disabled.)


// TODO: PARITY & ERROR

assign ERR_n = 1; // Error flag logic to be implemented
assign PAR_OUT = 0; // Error flag logic to be implemented



endmodule

