//////////////////////////////////////////////////////////////////////////////////
//
//
//  Machine state thats puts in value on db_level output only when that value
//  lasted for a while.
//
//
//////////////////////////////////////////////////////////////////////////////////

// Listing 6.2
module debounce #(parameter N0=7 , N1=4)
   (
    input wire clk, reset,
    input wire in,
    output reg db_level, db_tick
   );
   
   /*
    *  N0=7 ---> 8 ns * 2**7 ---> 1024 ns ~ 1us
    *  N1=2 ---> 8 ns * 2**2 --->   32 ns 
    */
   
   // symbolic state declaration
   localparam  [1:0]
               zero  = 2'b00,
               wait0 = 2'b01,
               one   = 2'b10,
               wait1 = 2'b11;
   
   // signal declaration
   reg [N0-1:0] q_reg, q_next;
   reg [1:0] state_reg, state_next;

   // body
   // fsmd state & data registers
    always @(posedge clk, posedge reset)
       if (reset)
          begin
             state_reg <= zero;
             q_reg <= 0;
          end
       else
          begin
             state_reg <= state_next;
             q_reg <= q_next;
          end

   // next-state logic & data path functional units/routing
   always @*
   begin
      state_next = state_reg;   // default state: the same
      q_next = q_reg;           // default q: unchnaged
      db_tick = 1'b0;           // default output: 0
      case (state_reg)
         zero:
            begin
               db_level = 1'b0;
               if (in)
                  begin
                     state_next = wait1;
                     q_next = {N0{1'b1}}; // load 1..1
                  end
            end
         wait1:
            begin
               db_level = 1'b0;
               if (in)
                  begin
                     q_next = q_reg - 1;
                     if (q_next==0)
                        begin
                           state_next = one;
                           db_tick = 1'b1;
                        end
                  end
               else // in==0
                  state_next = zero;
            end
         one:
            begin
               db_level = 1'b1;
               if (~in)
                  begin
                     state_next = wait0;
                     q_next = { {N0-N1{1'b0}}  , {N1{1'b1}}  }; // load 1..1
                  end
            end
         wait0:
            begin
               db_level = 1'b1;
               if (~in)
                  begin
                     q_next = q_reg - 1;
                     if (q_next==0)
                        state_next = zero;
                  end
               else // in==1
                  state_next = one;

            end
         default: state_next = zero;
      endcase
   end

endmodule


/* 
Instantiation example:

debounce #(.N0(7) , N1(4)) i_debounce_NAME ( .clk(clk), .reset(rst), .in(IN), .db_level(OUT), .db_tick (OUT_TICK)  );

*/
