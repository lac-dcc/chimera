
`define STR(x) `"x`"

`ifndef WAVE_FILE
    `define WAVE_FILE waves.vcd
`endif

//
// module: p_mul_tb
//
//  Randomised testbech for the p_mul module.
//  Using a simulation based approach for p_mul module, since BMC
//  approaches can't handle multiplication.
//
module p_mul_tb ();

reg         clock   ;
reg         resetn  ;

reg         valid   ;
wire        ready   ;

reg         mul_l   ;
wire        mul_h   = !mul_l;
reg         clmul   ;
reg  [4:0]  pw      ;

reg  [31:0] crs1    ;
reg  [31:0] crs2    ;

wire [31:0] result  ;
wire [31:0] result_hi;
wire [31:0] expectation;

wire        output_valid = valid && ready;
reg  [2:0]  pw_rand ;

always @(posedge clock) begin
    pw_rand <= $unsigned($random) % 5;
end

integer     clock_ticks  = 0;
parameter   max_ticks    = 100000;

// Initial values
initial begin

    $dumpfile(`STR(`WAVE_FILE));
    $dumpvars(0, p_mul_tb);

    pw_rand = 0;
    resetn  = 1'b0;
    clock   = 1'b0;
    valid   = 1'b0;

    #40 resetn = 1'b1;
end

// Make the clock tick.
always @(clock) #20 clock <= !clock;

// Input stimulus generation
always @(posedge clock) begin

    clock_ticks = clock_ticks + 1;

    // Randomise inputs.
    if(!valid || (valid && ready)) begin
        crs1    <= ($random & 32'hFFFF_FFFF);
        crs2    <= ($random & 32'hFFFF_FFFF);
        valid   <= $random;
        
        if(pw_rand == 0) begin
            pw      <= 5'b00001;
        end else if(pw_rand == 1) begin
            pw      <= 5'b00010;
        end else if(pw_rand == 2) begin
            pw      <= 5'b00100;
        end else if(pw_rand == 3) begin
            pw      <= 5'b01000;
        end else if(pw_rand == 4) begin
            pw      <= 5'b10000;
        end

        clmul   <= $random;
        mul_l   <= $random;
    end

    if(clock_ticks > max_ticks) begin
        $finish;
    end

end

//
// Results checking
always @(posedge clock) begin

    if(valid && ready) begin

        if(result != expectation) begin

            $display("pw=%b, crs1=%d, crs2=%d",pw,crs1,crs2);
            $display("clmul=%d, mul_l=%d, mul_h=%d",clmul,mul_l,mul_h);
            $display("Expected: %h %d %b",expectation,expectation,expectation);
            $display("Got     : %h %d %b",result,result,result);

            #20 $finish();

        end

    end

end


//
// DUT instantiation.
p_mul i_dut(
.clock (clock ),
.resetn(resetn),
.valid (valid ),
.ready (ready ),
.mul_l (mul_l ),
.mul_h (mul_h ),
.clmul (clmul ),
.pw    (pw    ),
.crs1  (crs1  ),
.crs2  (crs2  ),
.result(result)
);


//
// Checker instantiation.
p_mul_checker i_p_mul_checker (
.mul_l (mul_l       ),
.mul_h (mul_h       ),
.clmul (clmul       ),
.pw    (pw          ),
.crs1  (crs1        ),
.crs2  (crs2        ),
.result_hi(result_hi),
.result(expectation )
);

endmodule

