`default_nettype none

module top (
	input  clk,
    input [7:0] adc,
    output [1:0] gpio,
    output adc_clk,
    output adc_shutdown,
    output hsync,
    output vsync,
    output vga_r,
    output vga_g,
    output vga_b

);

    `include "tests/localparams.vh"

    reg [6:0] update_counter = 0; // when this wraps we update the frequency bins
    reg [8:0] read_cycles = 0; // keep track of fft reads -> bram

    integer i;

    wire [9:0] x_px;
    wire [9:0] y_px;
    wire signed [freq_data_w-1:0] bin_out_imag;
    wire signed [freq_data_w-1:0] bin_out_real;
    wire fft_ready;
    wire fft_clk = px_clk;
    reg fft_start = 0;
    wire fft_read; // = 0;

    reg [7:0] sample = 0;
    reg [7:0] temp_sample = 0;

    sdft #( .data_width(data_width), .freq_bins(freq_bins), .freq_w(freq_data_w)) sdft_0(.clk (fft_clk), .sample(sample), .ready(fft_ready), .start(fft_start), .read(fft_read), .bin_out_real(bin_out_real), .bin_out_imag(bin_out_imag), .bin_addr(freq_bram_w_addr)); 

    wire px_clk;
    wire activevideo;
    wire draw_bar;
    assign vga_g = activevideo && (draw_bar || x_px < 5);
    assign vga_r = activevideo && draw_bar; // not connected on the board at the mo
    assign vga_b = activevideo && draw_bar;

    VgaSyncGen vga_inst( .clk(clk), .hsync(hsync), .vsync(vsync), .x_px(x_px), .y_px(y_px), .px_clk(px_clk), .activevideo(activevideo));

    reg [bin_addr_w-1:0] freq_bram_w_addr = 0;
    wire [bin_addr_w-1:0] freq_bram_r_addr;
    wire [freq_data_w-1:0] freq_bram_out;
    reg [freq_data_w-1:0] freq_bram_in = 0;
    reg freq_bram_w = 0; // write enable signal
    wire freq_bram_r; // read enable signal
    wire freq_bram_r_clk = px_clk;
    wire freq_bram_w_clk = px_clk;

    freq_bram #(.addr_w(bin_addr_w), .data_w(freq_data_w)) freq_bram_0(.w_clk(freq_bram_w_clk), .r_clk(freq_bram_r_clk), .w_en(freq_bram_w), .r_en(freq_bram_r), .d_in(freq_bram_in), .d_out(freq_bram_out), .r_addr(freq_bram_r_addr), .w_addr(freq_bram_w_addr));

    ///////////////////////////////////////////////////////////////
    // adc
    assign adc_shutdown = 0;
    assign adc_clk = clk;
    always @(negedge adc_clk)
        temp_sample <= adc;

    ///////////////////////////////////////////////////////////////
    //
    // run the fft
    assign fft_read = (state == STATE_PROCESS) && fft_ready && ! activevideo;
    assign gpio[0] = (state == STATE_WAIT_START); // purple tracae
    assign gpio[1] = (state == STATE_WRITE_BRAM); // blue trace

    reg [3:0] state = STATE_WAIT_FFT;
    // sample data as fast as possible
    always @(posedge fft_clk) begin
        case(state)
            STATE_WAIT_FFT: begin
                if(fft_ready) begin
                    sample <= temp_sample;
                    fft_start <= 1'b1;
                    state <= STATE_WAIT_START;
                end
            end

            STATE_WAIT_START: begin
                if(fft_ready == 0)
                    state <= STATE_PROCESS;
            end

            STATE_PROCESS: begin
                fft_start <= 1'b0;
                if(fft_ready) begin
                    update_counter <= update_counter + 1;
                    if(update_counter == FFT_READ_CYCLES && ! activevideo) begin // read the next bank of frequency data into the bram
                        update_counter <= 0;
                        // read flag set by wire assignment instead to meet timing
                        //        fft_read <= 1'b1;
                        state <= STATE_READ;
                    end else
                        state <= STATE_WAIT_FFT;
                end else
                    state <= STATE_PROCESS;
            end

            STATE_READ: begin
                // store the squared bin value to BRAM
                read_cycles <= read_cycles + 1;
                freq_bram_in <= ((bin_out_real * bin_out_real) + (bin_out_imag * bin_out_imag)) >> 8; // some divider here
                //fft_read <= 1'b0;
                freq_bram_w <= 1'b1;
                state <= STATE_WRITE_BRAM;
            end

            STATE_WRITE_BRAM: begin
                freq_bram_w <= 1'b0;
                state <= STATE_WAIT_FFT;
                // increment the counter and wrap it
                freq_bram_w_addr <= freq_bram_w_addr + 1;
                if(freq_bram_w_addr == freq_bins -1)
                    freq_bram_w_addr <= 0;
            end

        endcase
    end
    
    ///////////////////////////////////////////////////////////////
    //
    // draw the bars

    // bram addr is calculated from y_px
    assign freq_bram_r_addr = y_px / bar_height;
    // request new value at top of bar and left side of screen
    wire start_of_screen = y_px == 0 && x_px == 0 && activevideo;
    wire start_of_line = x_px == 0 && activevideo;
    assign freq_bram_r = bar_height_counter == 0 && start_of_line;
    // draw the bar if the x_px is below the frequency value
    assign draw_bar = x_px < freq_bram_out;
    reg [bar_height_counter_w:0] bar_height_counter = 0;

    // increment bar_height_counter every new line, reset to 0 at top of the screen and after every bar
    always@(posedge start_of_line) begin
        bar_height_counter <= bar_height_counter + 1;
        if(start_of_screen)
            bar_height_counter <= 0;
        else if(bar_height_counter == bar_height - 1)
            bar_height_counter <= 0;
    end

endmodule
