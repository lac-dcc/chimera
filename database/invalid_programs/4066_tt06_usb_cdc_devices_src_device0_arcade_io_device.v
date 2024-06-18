// This program was cloned from: https://github.com/mbalestrini/tt06_usb_cdc_devices
// License: Apache License 2.0

`default_nettype none

module arcade_io_device #(
    parameter NUM_INPUTS = 8
)(
   input        clk_i,
   input        rstn_i,

   input        [NUM_INPUTS-1:0] inputs_i,

   // ---- to/from USB_CDC ------------------------------------------
   input wire [10:0]      frame_i,
   
   output reg [7:0] in_data_o,
   output reg   in_valid_o,
   // While in_valid_o is high, in_data_o shall be valid.
   input wire   in_ready_i,
   // When both in_ready_i and in_valid_o are high, in_data_o shall
   //   be consumed.
   input wire [7:0]  out_data_i,
   input wire        out_valid_i,
   // While out_valid_i is high, the out_data_i shall be valid and both
   //   out_valid_i and out_data_i shall not change until consumed.
   output reg       out_ready_o,
   // When both out_valid_i and out_ready_o are high, the out_data_i shall
   //   be consumed.
   input wire   usb_configured_i
);

localparam DEBOUNCE_MS = 10;
localparam INDEX_SIZE = $clog2(NUM_INPUTS);

reg beat_1ms; // Use USB frames (1 per millisecond aprox) to time events
reg last_frame_beat;

wire [NUM_INPUTS-1:0] debounced_inputs;
reg [NUM_INPUTS-1:0] last_input_sent;

reg [INDEX_SIZE-1:0] input_index;


// beat_1ms, last_frame_beat
always @(posedge clk_i) begin
    if(~rstn_i) begin
        last_frame_beat <= 0;         
        beat_1ms <= 0;
    end else begin
        beat_1ms <= (last_frame_beat != frame_i[0]);
        last_frame_beat <= frame_i[0];
    end      
end

// debouncers
genvar i;
generate
    for(i=0; i<NUM_INPUTS; i=i+1) begin : input_debouncers
        input_debouncer  #(
            .DEBOUNCE_HIST(DEBOUNCE_MS)    
        ) u_input_debouncer (
            .clk_i(clk_i),
            .rstn_i(rstn_i),
            .beat_1ms_i(beat_1ms),
            .input_i(inputs_i[i]),
            .output_o(debounced_inputs[i])
        );
    end
endgenerate

reg wait_one_clock;

always @(posedge clk_i) begin
    if(~rstn_i) begin
        in_data_o <= 8'b0;
        in_valid_o <= 0;
        out_ready_o <= 0;
        last_input_sent <= {NUM_INPUTS{1'b0}};
        wait_one_clock <= 0;
        input_index <= 0;
    end else begin
        // Discard input from host
        out_ready_o <= 1;

        in_valid_o <= 0;
        in_data_o <= 8'b0;
        wait_one_clock <= 0;
        if(in_ready_i && ~wait_one_clock) begin
            input_index <= input_index + 1;
            if((last_input_sent[input_index] != debounced_inputs[input_index])) begin
                in_valid_o <= 1;
                in_data_o <= debounced_inputs[input_index] ? 8'h41 + {{8-INDEX_SIZE{1'b0}}, input_index} : 8'h61 + {{8-INDEX_SIZE{1'b0}}, input_index};   
                last_input_sent[input_index] <= debounced_inputs[input_index];
                wait_one_clock <= 0;
            end            
        end
    end
    
end


// FORMAL VERIFICATION
`ifdef FORMAL
    // register for knowing if we have just started
    reg f_past_valid = 0;
    
    reg [10:0] test_counter = 0;
    // initial assume(input_index==0);
    
    always @(posedge clk_i) begin 
        f_past_valid <= 1;        
    
        if(f_past_valid) begin
            COVER_INPUT_INDEX_MAX: cover(input_index==(NUM_INPUTS-1));
            PROVE_INPUT_INDEX_LIMIT: assert(input_index<NUM_INPUTS);
            
            if($past(rstn_i)) begin
                if($past(in_ready_i)) begin
                    PROVE_INPUT_INDEX_INC: assert($changed(input_index));    
                end

               
                test_counter <= test_counter + 1;
                in_ready_i <= 1;
                cover(test_counter==20);    
            end
        end            
    end

    

`endif

endmodule
