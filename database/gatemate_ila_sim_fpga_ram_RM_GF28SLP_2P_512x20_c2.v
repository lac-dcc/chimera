
module RM_GF28SLP_2P_512x20_c2 (//inputs port 
                                 A_CLK_I,
                                 A_CS_I,
                                 A_ADDR_I,
                                 A_DW_I,
                                 A_BM_I, 
                                 A_WE_I,
                                 A_RE_I, 

                                 //output port a
                                 A_DR_O,

                                 //inputs port b
                                 B_CLK_I,
                                 B_CS_I,
                                 B_ADDR_I,
                                 B_DW_I,
                                 B_BM_I, 
                                 B_WE_I,
                                 B_RE_I, 

                                 //output port b
                                 B_DR_O,

                                 A_DLYL_I,
                                 A_DLYH_I,
                                 A_DLYCLK_I,
                                 B_DLYL_I,
                                 B_DLYH_I,
                                 B_DLYCLK_I);
   
   
   parameter P_DATA_WIDTH =  20;
   parameter P_ADDR_WIDTH =  9;
   parameter P_COUNT =      512; //2^P_ADDR_WIDTH
   
   //inputs port a
   input              A_CLK_I;
   input              A_CS_I;
   input [P_ADDR_WIDTH-1:0] A_ADDR_I;
   input [P_DATA_WIDTH-1:0] A_DW_I;
   input [P_DATA_WIDTH-1:0] A_BM_I; 
   input                    A_WE_I;
   input                    A_RE_I;

   //output port a
   output [P_DATA_WIDTH-1:0] A_DR_O;

   //inputs port b
   input                     B_CLK_I;
   input                     B_CS_I;
   input [P_ADDR_WIDTH-1:0]  B_ADDR_I;
   input [P_DATA_WIDTH-1:0]  B_DW_I;
   input [P_DATA_WIDTH-1:0]  B_BM_I; 
   input                     B_WE_I;
   input                     B_RE_I; 

   //output port b
   output [P_DATA_WIDTH-1:0] B_DR_O;


   input wire [1:0]          A_DLYL_I;
   input wire [1:0]          A_DLYH_I;
   input wire [1:0]          A_DLYCLK_I;

   input wire [1:0]          B_DLYL_I;
   input wire [1:0]          B_DLYH_I;
   input wire [1:0]          B_DLYCLK_I;
   
   reg                       notifier;
   // read or write access
   wire A_RW_ACCESS = (A_WE_I || A_RE_I) && A_CS_I;
   wire B_RW_ACCESS = (B_WE_I || B_RE_I) && B_CS_I;
   // write access
   wire A_W_ACCESS  = A_WE_I && A_CS_I;
   wire B_W_ACCESS  = B_WE_I && B_CS_I;
   
`define FUNCTIONAL

`ifdef FUNCTIONAL  //  functional //

   RM_GF28SLP_2P_core_1cr
     #(.P_DATA_WIDTH(P_DATA_WIDTH),
       .P_ADDR_WIDTH(P_ADDR_WIDTH),
       .P_COUNT(P_COUNT))
   //RM_GF28SLP_2P_512x20_c2_behav_inst
   RM_GF28SLP_2P_512x20_c2_inst
     //inputs port A
     (.A_CLK_I(A_CLK_I),
      .A_CS_I(A_CS_I),
      .A_ADDR_I(A_ADDR_I),
      .A_DW_I(A_DW_I),
      .A_BM_I(A_BM_I), 
      .A_WE_I(A_WE_I),
      .A_RE_I(A_RE_I), 

      //output port A
      .A_DR_O(A_DR_O),

      //inputs port B
      .B_CLK_I(B_CLK_I),
      .B_CS_I(B_CS_I),
      .B_ADDR_I(B_ADDR_I),
      .B_DW_I(B_DW_I),
      .B_BM_I(B_BM_I), 
      .B_WE_I(B_WE_I),
      .B_RE_I(B_RE_I), 

      //output port B
      .B_DR_O(B_DR_O),

      .A_DLYL_I(A_DLYL_I),
      .A_DLYH_I(A_DLYH_I),
      .A_DLYCLK_I(A_DLYCLK_I),
      .B_DLYL_I(B_DLYL_I),
      .B_DLYH_I(B_DLYH_I),
      .B_DLYCLK_I(B_DLYCLK_I)
      );
   
`else

   //delayed inputs port A, to make negative setup and holds possible
   wire                      A_CLK_I_DELAY;
   wire                      A_CS_I_DELAY;
   wire [P_ADDR_WIDTH-1:0]   A_ADDR_I_DELAY;
   wire [P_DATA_WIDTH-1:0]   A_DW_I_DELAY;
   wire [P_DATA_WIDTH-1:0]   A_BM_I_DELAY; 
   wire                      A_WE_I_DELAY;
   wire                      A_RE_I_DELAY;

   //delayed inputs port B, to make negative setup and holds possible   
   wire                      B_CLK_I_DELAY;
   wire                      B_CS_I_DELAY;
   wire [P_ADDR_WIDTH-1:0]   B_ADDR_I_DELAY;
   wire [P_DATA_WIDTH-1:0]   B_DW_I_DELAY;
   wire [P_DATA_WIDTH-1:0]   B_BM_I_DELAY; 
   wire                      B_WE_I_DELAY;
   wire                      B_RE_I_DELAY; 

   RM_GF28SLP_2P_core_1cr
     #(.P_DATA_WIDTH(P_DATA_WIDTH),
       .P_ADDR_WIDTH(P_ADDR_WIDTH),
       .P_COUNT(P_COUNT))
   RM_GF28SLP_2P_512x20_c2_inst
     //inputs port A
     (.A_CLK_I(A_CLK_I_DELAY),
      .A_CS_I(A_CS_I_DELAY),
      .A_ADDR_I(A_ADDR_I_DELAY),
      .A_DW_I(A_DW_I_DELAY),
      .A_BM_I(A_BM_I_DELAY), 
      .A_WE_I(A_WE_I_DELAY),
      .A_RE_I(A_RE_I_DELAY), 

      //output port A
      .A_DR_O(A_DR_O),

      //inputs port B
      .B_CLK_I(B_CLK_I_DELAY),
      .B_CS_I(B_CS_I_DELAY),
      .B_ADDR_I(B_ADDR_I_DELAY),
      .B_DW_I(B_DW_I_DELAY),
      .B_BM_I(B_BM_I_DELAY), 
      .B_WE_I(B_WE_I_DELAY),
      .B_RE_I(B_RE_I_DELAY), 

      //output port B
      .B_DR_O(B_DR_O),

      .A_DLYL_I(A_DLYL_I),
      .A_DLYH_I(A_DLYH_I),
      .A_DLYCLK_I(A_DLYCLK_I),
      .B_DLYL_I(B_DLYL_I),
      .B_DLYH_I(B_DLYH_I),
      .B_DLYCLK_I(B_DLYCLK_I)
      );

   /*specify
      
      (posedge A_CLK_I *> (A_DR_O : A_DW_I)) = (1.0, 1.0); // A_CLK_I to all A_DR_O bits
      (posedge B_CLK_I *> (B_DR_O : B_DW_I)) = (1.0, 1.0); // B_CLK_I to all B_DR_O bits
  
      $width(posedge B_CLK_I, 1.0,0,notifier);   
      $width(posedge A_CLK_I, 1.0,0,notifier);  */ 

      /*$setuphold(posedge A_CLK_I &&& A_CS_I, posedge A_CS_I, 1.0, 1.0,notifier,,,A_CLK_I_DELAY, A_CS_I_DELAY);
      $setuphold(posedge A_CLK_I &&& A_CS_I, posedge A_RE_I, 1.0, 1.0,notifier,,,A_CLK_I_DELAY, A_RE_I_DELAY);
      $setuphold(posedge A_CLK_I &&& A_CS_I, posedge A_WE_I, 1.0, 1.0,notifier,,,A_CLK_I_DELAY, A_WE_I_DELAY);
      $setuphold(posedge A_CLK_I &&& A_CS_I, negedge A_CS_I, 1.0, 1.0,notifier,,,A_CLK_I_DELAY, A_CS_I_DELAY);
      $setuphold(posedge A_CLK_I &&& A_CS_I, negedge A_RE_I, 1.0, 1.0,notifier,,,A_CLK_I_DELAY, A_RE_I_DELAY);
      $setuphold(posedge A_CLK_I &&& A_CS_I, negedge A_WE_I, 1.0, 1.0,notifier,,,A_CLK_I_DELAY, A_WE_I_DELAY);

      $setuphold(posedge B_CLK_I &&& B_CS_I, posedge B_CS_I, 1.0, 1.0,notifier,,,B_CLK_I_DELAY, B_CS_I_DELAY);
      $setuphold(posedge B_CLK_I &&& B_CS_I, posedge B_RE_I, 1.0, 1.0,notifier,,,B_CLK_I_DELAY, B_RE_I_DELAY);
      $setuphold(posedge B_CLK_I &&& B_CS_I, posedge B_WE_I, 1.0, 1.0,notifier,,,B_CLK_I_DELAY, B_WE_I_DELAY);
      $setuphold(posedge B_CLK_I &&& B_CS_I, negedge B_CS_I, 1.0, 1.0,notifier,,,B_CLK_I_DELAY, B_CS_I_DELAY);
      $setuphold(posedge B_CLK_I &&& B_CS_I, negedge B_RE_I, 1.0, 1.0,notifier,,,B_CLK_I_DELAY, B_RE_I_DELAY);
      $setuphold(posedge B_CLK_I &&& B_CS_I, negedge B_WE_I, 1.0, 1.0,notifier,,,B_CLK_I_DELAY, B_WE_I_DELAY);
      
      
      $setuphold(posedge A_CLK_I &&& A_RW_ACCESS, posedge A_ADDR_I, 1.0 ,1.0, notifier,,,A_CLK_I_DELAY, A_ADDR_I_DELAY);
      $setuphold(posedge A_CLK_I &&& A_RW_ACCESS, negedge A_ADDR_I, 1.0 ,1.0, notifier,,,A_CLK_I_DELAY, A_ADDR_I_DELAY);

      $setuphold(posedge A_CLK_I &&& A_W_ACCESS, posedge A_DW_I, 1.0 ,1.0, notifier,,,A_CLK_I_DELAY, A_DW_I_DELAY);
      $setuphold(posedge A_CLK_I &&& A_W_ACCESS, negedge A_DW_I, 1.0 ,1.0, notifier,,,A_CLK_I_DELAY, A_DW_I_DELAY);

      $setuphold(posedge A_CLK_I &&& A_W_ACCESS, posedge A_BM_I, 1.0 ,1.0, notifier,,,A_CLK_I_DELAY, A_BM_I_DELAY);
      $setuphold(posedge A_CLK_I &&& A_W_ACCESS, negedge A_BM_I, 1.0 ,1.0, notifier,,,A_CLK_I_DELAY, A_BM_I_DELAY);


      
      $setuphold(posedge B_CLK_I &&& B_RW_ACCESS, posedge B_ADDR_I, 1.0 ,1.0, notifier,,,B_CLK_I_DELAY, B_ADDR_I_DELAY);
      $setuphold(posedge B_CLK_I &&& B_RW_ACCESS, negedge B_ADDR_I, 1.0 ,1.0, notifier,,,B_CLK_I_DELAY, B_ADDR_I_DELAY);

      $setuphold(posedge B_CLK_I &&& B_W_ACCESS, posedge B_DW_I, 1.0 ,1.0, notifier,,,B_CLK_I_DELAY, B_DW_I_DELAY);
      $setuphold(posedge B_CLK_I &&& B_W_ACCESS, negedge B_DW_I, 1.0 ,1.0, notifier,,,B_CLK_I_DELAY, B_DW_I_DELAY);

      $setuphold(posedge B_CLK_I &&& B_W_ACCESS, posedge B_BM_I, 1.0 ,1.0, notifier,,,B_CLK_I_DELAY, B_BM_I_DELAY);
      $setuphold(posedge B_CLK_I &&& B_W_ACCESS, negedge B_BM_I, 1.0 ,1.0, notifier,,,B_CLK_I_DELAY, B_BM_I_DELAY);*/


   //endspecify
   
`endif 
   
endmodule
