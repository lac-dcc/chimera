`timescale 1ns / 100ps

module tb_sm4_top();

    reg			    clk		            ;
    reg			    reset_n	            ;
    reg             sm4_enable_in       ;
    reg             encdec_enable_in    ;
    reg             encdec_sel_in       ;
    reg             valid_in            ;
    reg   [127: 0]  data_in             ;
    reg             enable_key_exp_in   ;
    reg             user_key_valid_in   ;
    reg   [127: 0]  user_key_in         ;
    wire            ready_out           ;
    wire            key_exp_ready_out   ;
    wire  [127: 0]  result_out          ;
    

    always #3 clk = ~clk;


    initial
        begin
            clk		            = 0;
            reset_n	            = 0;
            sm4_enable_in       = 0;
            encdec_enable_in    = 0;
            encdec_sel_in       = 0;
            valid_in            = 0;
            data_in             = 0;
            enable_key_exp_in   = 0;
            user_key_valid_in   = 0;
            user_key_in         = 0;
            #111;
            reset_n = 1;
            #111;
            sm4_enable_in = 1;
            #111;
            enable_key_exp_in = 1;
            #111;
            @(posedge clk)
            begin
            user_key_valid_in = 1'b1;
            user_key_in       = 128'h0123456789abcdeffedcba9876543210;
            end
            wait(key_exp_ready_out);
            #111;
            encdec_enable_in = 1;
            #111;
            @(posedge clk)
            begin
            valid_in = 1'b1;
            data_in = 128'h0123456789abcdeffedcba9876543210;
            end
            @(posedge clk) valid_in = 1'b0;
            wait(ready_out);
            #300;
            sm4_enable_in       = 0;
            encdec_enable_in    = 0;
            encdec_sel_in       = 0;
            valid_in            = 0;
            data_in             = 0;
            enable_key_exp_in   = 0;
            user_key_valid_in   = 0;
            user_key_in         = 0;
            #111;
            sm4_enable_in       = 1;
            #111;
            encdec_sel_in       = 1;
            enable_key_exp_in   = 1;
            #111;
            @(posedge clk)
            begin
            user_key_valid_in = 1'b1;
            user_key_in       = 128'h0123456789abcdeffedcba9876543210;
            end
            wait(key_exp_ready_out);
            #111;
            encdec_enable_in = 1;
            #111;
            @(posedge clk)
            begin
            valid_in = 1'b1;
            data_in = 128'h681edf34d206965e86b3e94f536e4246;
            end
            #300;
            $finish;
        end
      
      
      
    always@(*)        
        if(~encdec_sel_in)
            $display("Test of Encryption....\n");
        else
            $display("Test of Decryption....\n");
            
            
    always@(*)                
        if(valid_in)
            $display("Input Data: %h\n", data_in); 

            
    always@(*)                
        if(~encdec_sel_in && ready_out)
            begin
                $display("Expected encryption result: 128'h681edf34d206965e86b3e94f536e4246");
                $display("Actual   encryption result: %h", result_out);
                if(result_out == 128'h681edf34d206965e86b3e94f536e4246 )
                        $display("Correct! The same as the expected!\n");
                else
                    begin
                        $display("Error!\n");
                    end
            end
            
    always@(*)                
        if(encdec_sel_in && ready_out)
            begin
                $display("Expected decryption result: 128'h0123456789abcdeffedcba9876543210");
                $display("Actual   decryption result: %h", result_out);
                if(result_out == 128'h0123456789abcdeffedcba9876543210 )
                        $display("Correct! The same as the expected!\n");
                else
                    begin
                        $display("Error!\n");
                    end
            end           
            
          
    sm4_top uut(
        .clk		         (clk		        ),
        .reset_n	         (reset_n	        ),
        .sm4_enable_in       (sm4_enable_in     ),
        .encdec_enable_in    (encdec_enable_in  ),
        .encdec_sel_in       (encdec_sel_in     ),
        .valid_in            (valid_in          ),
        .data_in             (data_in           ),
        .enable_key_exp_in   (enable_key_exp_in ),
        .user_key_valid_in   (user_key_valid_in ),
        .user_key_in         (user_key_in       ),
        .ready_out           (ready_out         ),
        .key_exp_ready_out   (key_exp_ready_out ),
        .result_out          (result_out        )
    );
    

endmodule