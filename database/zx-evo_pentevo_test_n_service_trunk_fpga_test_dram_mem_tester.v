/*

reset...init...save.start_write.stop_write.restore.start_read(compare).stop_read.loop

*/

module mem_tester(

    clk,

    rst_n,

// pass/fail counters
    pass_counter,
    fail_counter,

// DRAM signals
    DRAM_DQ,

    DRAM_MA,

    DRAM_RAS0_N,
    DRAM_RAS1_N,
    DRAM_LCAS_N,
    DRAM_UCAS_N,
    DRAM_WE_N
);

parameter DRAM_DATA_SIZE = 16;
parameter DRAM_MA_SIZE = 10;

    inout [DRAM_DATA_SIZE-1:0] DRAM_DQ;
    output [DRAM_MA_SIZE-1:0] DRAM_MA;
    output DRAM_RAS0_N,DRAM_RAS1_N,DRAM_LCAS_N,DRAM_UCAS_N,DRAM_WE_N;

    input clk;

    input rst_n;



    reg inc_pass_ctr;
    reg inc_err_ctr;

    reg check_in_progress; // when 1 - enables errors checking


//----

    reg [15:0] pass_counter;
    output [15:0] pass_counter;
    reg [15:0] fail_counter;
    output [15:0] fail_counter;
    reg was_error;

    always @(posedge clk, negedge rst_n)
    begin
        if( !rst_n )
        begin
            pass_counter <= 16'd0;
            fail_counter <= 16'd0;
        end
        else if( inc_pass_ctr )
        begin
            if( (!was_error)&&(pass_counter!=16'hffff) )
                pass_counter <= pass_counter + 16'd1;
            if( (was_error)&&(fail_counter!=16'hffff) )
                fail_counter <= fail_counter + 16'd1;
            was_error <= 1'b0;
        end
        else if( inc_err_ctr )
            was_error <= 1'b1;
    end

//----



    reg rnd_init,rnd_save,rnd_restore; // rnd_vec_gen control
    wire [DRAM_DATA_SIZE-1:0] rnd_out; // rnd_vec_gen output

    rnd_vec_gen my_rnd( .clk(clk), .init(rnd_init), .next(ram_ready), .save(rnd_save), .restore(rnd_restore), .out(rnd_out) );
    defparam my_rnd.OUT_SIZE = DRAM_DATA_SIZE;

    defparam my_rnd.LFSR_LENGTH = 17;
    defparam my_rnd.LFSR_FEEDBACK = 14;




    reg ram_start,ram_rnw;
    wire ram_stop,ram_ready;
    wire [DRAM_DATA_SIZE-1:0] ram_rdat;

    dram_control my_ram( .clk(clk), .start(ram_start), .rnw(ram_rnw), .stop(ram_stop), .ready(ram_ready),
                         .rdat(ram_rdat), .wdat(rnd_out),
                         .DRAM_DQ(DRAM_DQ), .DRAM_MA(DRAM_MA), .DRAM_RAS0_N(DRAM_RAS0_N), .DRAM_RAS1_N(DRAM_RAS1_N),
                         .DRAM_LCAS_N(DRAM_LCAS_N), .DRAM_UCAS_N(DRAM_UCAS_N), .DRAM_WE_N(DRAM_WE_N) );







// FSM states and registers
    reg [3:0] curr_state,next_state;

parameter RESET        = 4'h0;

parameter INIT1        = 4'h1;
parameter INIT2        = 4'h2;

parameter BEGIN_WRITE1 = 4'h3;
parameter BEGIN_WRITE2 = 4'h4;
parameter BEGIN_WRITE3 = 4'h5;
parameter BEGIN_WRITE4 = 4'h6;

parameter WRITE        = 4'h7;

parameter BEGIN_READ1  = 4'h8;
parameter BEGIN_READ2  = 4'h9;
parameter BEGIN_READ3  = 4'hA;
parameter BEGIN_READ4  = 4'hB;

parameter READ         = 4'hC;

parameter END_READ     = 4'hD;

parameter INC_PASSES1  = 4'hE;
parameter INC_PASSES2  = 4'hF;


// FSM dispatcher

    always @*
    begin
        case( curr_state )

        RESET:
            next_state <= INIT1;

        INIT1:
                next_state <= INIT2;

        INIT2:
            if( ram_stop )
                next_state <= BEGIN_WRITE1;
            else
                next_state <= INIT2;

        BEGIN_WRITE1:
            next_state <= BEGIN_WRITE2;

        BEGIN_WRITE2:
            next_state <= BEGIN_WRITE3;

        BEGIN_WRITE3:
            next_state <= BEGIN_WRITE4;

        BEGIN_WRITE4:
            if( ram_stop )
                next_state <= BEGIN_WRITE4;
            else
                next_state <= WRITE;

        WRITE:
            if( ram_stop )
                next_state <= BEGIN_READ1;
            else
                next_state <= WRITE;

        BEGIN_READ1:
            next_state <= BEGIN_READ2;

        BEGIN_READ2:
            next_state <= BEGIN_READ3;

        BEGIN_READ3:
            next_state <= BEGIN_READ4;

        BEGIN_READ4:
            if( ram_stop )
                next_state <= BEGIN_READ4;
            else
                next_state <= READ;

        READ:
            if( ram_stop )
                next_state <= END_READ;
            else
                next_state <= READ;

        END_READ:
            next_state <= INC_PASSES1;

        INC_PASSES1:
            next_state <= INC_PASSES2;

        INC_PASSES2:
            next_state <= BEGIN_WRITE1;




        default:
            next_state <= RESET;


        endcase
    end


// FSM sequencer

    always @(posedge clk,negedge rst_n)
    begin
        if( !rst_n )
            curr_state <= RESET;
        else
            curr_state <= next_state;
    end


// FSM controller

    always @(posedge clk)
    begin
        case( curr_state )

//////////////////////////////////////////////////
        RESET:
        begin
            // various initializings begin

            inc_pass_ctr <= 1'b0;
            check_in_progress <= 1'b0;
            rnd_init <= 1'b1; //begin RND init
            rnd_save <= 1'b0;
            rnd_restore <= 1'b0;
            ram_start <= 1'b1;
            ram_rnw   <= 1'b1;
        end

        INIT1:
        begin
            rnd_init <= 1'b0; // end rnd init
            ram_start <= 1'b0;
        end

        INIT2:
        begin
        end



//////////////////////////////////////////////////
        BEGIN_WRITE1:
        begin
            rnd_save <= 1'b1;
        end

        BEGIN_WRITE2:
        begin
            rnd_save   <= 1'b0;
            ram_start <= 1'b1;
            ram_rnw   <= 1'b0;
        end

        BEGIN_WRITE3:
        begin
            ram_start <= 1'b0;
        end

/*      BEGIN_WRITE4:
        begin
            rnd_save   <= 1'b0;
            ram_start <= 1'b1;
        end
*/
/*      WRITE:
        begin
            ram_start <= 1'b0;
        end
*/



//////////////////////////////////////////////////
        BEGIN_READ1:
        begin
            rnd_restore <= 1'b1;
        end

        BEGIN_READ2:
        begin
            rnd_restore <= 1'b0;
            ram_start <= 1'b1;
            ram_rnw <= 1'b1;
        end

        BEGIN_READ3:
        begin
                ram_start <= 1'b0;
        end

        BEGIN_READ4:
        begin
                check_in_progress <= 1'b1;
        end
/*
        READ:
        begin
            ram_start <= 1'b0;
            check_in_progress <= 1'b1;
        end
*/
        END_READ:
        begin
            check_in_progress <= 1'b0;
        end

        INC_PASSES1:
        begin
            inc_pass_ctr <= 1'b1;
        end

        INC_PASSES2:
        begin
            inc_pass_ctr <= 1'b0;
        end




        endcase
    end





    always @(posedge clk)
        inc_err_ctr <= check_in_progress & ram_ready & ((ram_rdat==rnd_out) ? 1'b0: 1'b1);



endmodule


