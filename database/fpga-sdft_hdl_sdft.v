`default_nettype none
/*
    SDFT module: sliding DFT. See http://www.comm.toronto.edu/~dimitris/ece431/slidingdft.pdf for more details.
    The SDFT is not as efficient as an FFT to calculate an entire range, but can have arbitary numbers of bins 
    (not powers of 2), and single bins can be calculated, so in some cases it can be more efficient.

    The module has been tested against the Python numpy fft routine.

    Interface:

    clk         input clock. everything is done on rising edge.
    sample      input data. Width is set with data_width parameter
    start       start the process. If you have 32 bins, this will take 98 clocks (3 clocks per bin + 2 setup)
    read        when in idle will put the contents of the given frequency bin on bin_out_real and bin_out_imag
    bin_addr    which bin to read - value from 0 to bins-1
    ready       when sdft is in idle state - can now start or read

    Parameters: 

    data_width  how wide the input sample data is
    freq_bins   how many bins to calculate
    freq_w      how wide the frequency data should be
    FILE_REAL   real twiddle factors for each bin
    FILE_IMAG   imag twiddle factors for each bin. See python/gen_twiddle.py for generation of these files.

*/
module sdft
#(
    parameter data_width = 8,   
    parameter freq_bins = 16,
    parameter freq_w    = 20, // to prevent overflow
    parameter FILE_REAL = "hdl/twiddle_real.list",
    parameter FILE_IMAJ = "hdl/twiddle_imag.list"
)
(
    input wire                              clk,
    input wire [data_width-1:0]             sample,
    input wire                              start,
    input wire                              read,
    input wire [bin_addr_w-1:0]             bin_addr,

    output reg signed [freq_w-1:0]          bin_out_real,
    output reg signed [freq_w-1:0]          bin_out_imag,
    output wire                             ready
);


    initial begin
        bin_out_real <= 0;
        bin_out_imag <= 0;
    end

    reg [15:0] cycles = 0;

    // width of addr needed to address the frequency bins
    localparam bin_addr_w = $clog2(freq_bins);

    // register for the twiddle factor ROM
    reg [bin_addr_w-1:0] tw_addr;

    // register for sample index
    reg [bin_addr_w-1:0] sample_index;

    // twiddle factor ROM
    wire signed [data_width-1:0] twid_real;
    wire signed [data_width-1:0] twid_imag;
    twiddle_rom #(.addr_w(bin_addr_w), .data_w(data_width)) twiddle_rom_0(.clk(clk), .addr(tw_addr), .dout_real(twid_real), .dout_imag(twid_imag));

    // complex mult as a module
    /*
    wire signed [data_width*2-1:0] complex_mult_out_real;
    wire signed [data_width*2-1:0] complex_mult_out_imag;

    wire signed [data_width:0] complex_mult_in_a_real; // one extra bit for handling subtraction of delta
    wire signed [data_width:0] complex_mult_in_a_imag;

    complex_mult #(.data_in_w(data_width+1), .data_out_w(data_width*2)) complex_mult_0(.a_real(complex_mult_in_a_real), .a_imag(complex_mult_in_a_imag), .b_real(twid_real), .b_imag(twid_imag), .out_real(complex_mult_out_real), .out_imag(complex_mult_out_imag));

*/
    // frequency bins RAM - double width + 2 to handle multiply
    reg signed [freq_w-1:0] frequency_bins_real [freq_bins-1:0];
    reg signed [freq_w-1:0] frequency_bins_imag [freq_bins-1:0];

    // sample storage
    reg [data_width-1:0] samples [freq_bins-1:0];

    // delta storage (1 more than data_width to handle subtraction)
    reg signed [data_width:0] delta;

    integer j;
    initial begin
        tw_addr = 0;
        sample_index = 0;
        delta = 0;
        for(j = 0; j < freq_bins; j = j + 1)  begin
            samples[j] = 0;
            frequency_bins_real[j] = 0;
            frequency_bins_imag[j] = 0;
        end
    end



    localparam STATE_WAIT           = 0;
    localparam STATE_START          = 1;
    localparam STATE_READ           = 2;
    localparam STATE_LOAD_ROM       = 3;
    localparam STATE_WAIT_ROM       = 4;
    localparam STATE_CALC           = 5;
    localparam STATE_FINISH         = 6;

    reg [3:0] state = STATE_WAIT;
/*
    assign complex_mult_in_a_real = frequency_bins_real[tw_addr] + delta;
    assign complex_mult_in_a_imag = frequency_bins_imag[tw_addr]; // imag component
*/
    assign ready = (state == STATE_WAIT) ? 1'b1 : 1'b0;

    always@(posedge clk) begin
        case(state)
            STATE_WAIT: begin
                if(start)
                    state <= STATE_START;
                if(read)
                    state <= STATE_READ;
            end 

            STATE_READ: begin
                bin_out_real <= frequency_bins_real[bin_addr];
                bin_out_imag <= frequency_bins_imag[bin_addr];
                state <= STATE_WAIT;

            end

            STATE_START: begin
                cycles <= cycles + 1; // keep track of how many cycles
                // get delta: newest - oldest
                delta <= sample - samples[sample_index];
                // store new sample
                samples[sample_index] <= sample;
                tw_addr <= 0;
                state <= STATE_CALC;
            end

            STATE_LOAD_ROM: begin // 2
                tw_addr <= tw_addr + 1; 
                if(tw_addr == freq_bins -1) begin
                    tw_addr <= 0;
                    state <= STATE_FINISH;
                end else
                    state <= STATE_WAIT_ROM;
            end

            STATE_WAIT_ROM: begin // 3
                state <= STATE_CALC;
            end

            STATE_CALC: begin // 4
                frequency_bins_real[tw_addr] <= ((frequency_bins_real[tw_addr] + delta) * twid_real - (frequency_bins_imag[tw_addr] * twid_imag)) >>> 7;
                frequency_bins_imag[tw_addr] <= ((frequency_bins_real[tw_addr] + delta) * twid_imag + (frequency_bins_imag[tw_addr] * twid_real)) >>> 7;
                state <= STATE_LOAD_ROM;
            end

            STATE_FINISH: begin
                // increment sample index (same as rotating)
                sample_index <= sample_index + 1;
                // reset index if it wraps
                if(sample_index == freq_bins)
                    sample_index <= 0;
                state <= STATE_WAIT;
            end 

        endcase
    end


endmodule

