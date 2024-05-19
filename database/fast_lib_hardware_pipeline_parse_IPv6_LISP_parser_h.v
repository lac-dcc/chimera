// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

`timescale 1ns/1ps
/*
pkt_Metadata[359:0] [359]discard; [358] to cm; [357]long pkt [356]no pkt body;[355]dispart marting ;[354]dispart id;[353:352]recv;[351:336]identify;[335:0]ingress rloc_src eid_dst metadata_parser


*/
module parser_h(
input         				ip_src_valid,
input 			[130:0] 	ip_src,
input 						clk,
input 						reset,
input							buf_addr_full,
input 						cdp2um_data_valid,
input 			[138:0] 	cdp2um_data,
output	reg				um2cdp_tx_enable,
output	reg				um2cdp_path,

output	reg 				pkt_head_valid,
output  	reg	[138:0] 	pkt_head,
output  	reg				pkt_payload_valid,
output  	reg	[138:0] 	pkt_payload,
output  	reg				pkt_metadata_valid,
output  	reg	[359:0] 	pkt_metadata, //wait to define;8bit-action; 16bit-identify;8bit-ingress; 128bit-rloc_src; 128bit-eid_dst; 72bit-metadata;

output	reg	[7:0]		input_count,
output	reg 	[7:0]		p0_a_count,
output	reg 	[7:0]		p0_b_count,
output	reg	[7:0]		input_nobody_count
);

reg [15:0]  identify;

//---reg---//
reg [7:0] ingress;
reg [127:0] rloc_src,eid_dst;
reg [71:0]  metadata_parser;

reg [7:0] ip_protocol;

reg [127:0] ip_src_1,ip_src_2,ip_src_3,ip_src_4,ip_src_5,ip_src_6,ip_src_7,ip_src_8;
reg [127:0] ip_src_match;

//------state------//
reg [3:0] parser_state;

parameter     idle              = 4'd0,
              parser_ip_src     = 4'd1,
              parser_ip_dst     = 4'd2,
              parser_udp        = 4'd3,
              parser_lisp_flag  = 4'd4,
              parser_eth_2      = 4'd5,
              parser_eid_src    = 4'd6,
              parser_eid_dst    = 4'd7,
              parser_udp_2      = 4'd8,
              trans_payload_notlisp = 4'd9,
              trans_pkt_controller	= 4'd10,
              trans_payload			= 4'd11,
              discard           = 4'd12,
              discard_notlisp   = 4'd13;
				  
				  
//-----------------state------------------//
reg cdp2um_state;
//-------------------cdp2um_state-------------------//
always @ (posedge clk or negedge reset)
if(!reset)	begin
  um2cdp_tx_enable <= 1'b1;
  cdp2um_state <= 1'b0;
  um2cdp_path <= 1'b0;
  end
    else	begin
        case(cdp2um_state)
          1'b0:
          begin
				  if((cdp2um_data_valid == 1'b0)&&(buf_addr_full == 1'b0))//zq0823
                begin
                    um2cdp_tx_enable <= 1'b1;
                    cdp2um_state <= 1'b1;
                end
              else
                begin
                    um2cdp_tx_enable <= 1'b0;
                end
          end
          1'b1:
          begin
              if(cdp2um_data_valid == 1'b1)
                begin
                    um2cdp_tx_enable <= 1'b0;
                    cdp2um_state <= 1'b0;
                end	
          end
        endcase
      end

//----------------------parser_state-------------------------//
always @ (posedge clk or negedge reset)
if(!reset)	begin
	input_count <= 8'b0;
	p0_a_count	<=	8'b0;
	p0_b_count	<=	8'b0;
	input_nobody_count	<=	8'b0;
	ingress <= 8'b0;  
	rloc_src <= 128'b0;
	eid_dst <= 128'b0;
	metadata_parser  <= 72'b0;
	pkt_metadata	<=	360'b0;
	pkt_metadata_valid <= 1'b0;
	pkt_head_valid <= 1'b0;
	pkt_head <= 139'b0;
	pkt_payload_valid <= 1'b0;
	pkt_payload <= 139'b0;
	identify <= 16'b0;
	ip_src_match <= 128'b0;
	
	parser_state <= idle;
	end
   else	begin
		case(parser_state)
      idle:	begin
         pkt_head_valid <= 1'b0;//zq0829
			pkt_payload_valid <= 1'b0;
         pkt_metadata_valid <= 1'b0;
         if(cdp2um_data_valid == 1'b1)
           begin
               if((cdp2um_data[138:136] == 3'b101) && (cdp2um_data[31:16] == 16'h86dd))
                 begin
                     parser_state <= parser_ip_src;
                     ingress <= {4'b0,cdp2um_data[131:128]};
                     metadata_parser[63:48] <= cdp2um_data[15:0];
                     
                     pkt_head_valid <= 1'b1;
                     pkt_head <= cdp2um_data;
                     
                    
                 end
               else
                 begin
                     pkt_head_valid <= 1'b0;
                     parser_state <= discard;
                 end
           end
         else
           begin
               parser_state <= idle;
               pkt_head_valid <= 1'b0;
           end
       end
      parser_ip_src:	begin
        pkt_head <= {3'b100,cdp2um_data[135:0]};
        pkt_head_valid <= 1'b1;
		 
        rloc_src[127:48] <= cdp2um_data[79:0];
        metadata_parser[47:0] <= cdp2um_data[127:80];
        ip_protocol <= cdp2um_data[95:88];
        
        case(ingress[2:0])
          3'd0: ip_src_match <= ip_src_1;
          3'd1: ip_src_match <= ip_src_2;
          3'd2: ip_src_match <= ip_src_3;
          3'd3: ip_src_match <= ip_src_4;
          3'd4: ip_src_match <= ip_src_5;
          3'd5: ip_src_match <= ip_src_6;
          3'd6: ip_src_match <= ip_src_7;
          3'd7: ip_src_match <= ip_src_8;
        endcase
        
        
        parser_state <= parser_ip_dst;
        end
            parser_ip_dst:
            begin
                pkt_head <= {3'b100,cdp2um_data[135:0]};
                pkt_head_valid <= 1'b1;
                rloc_src[47:0]  <= cdp2um_data[127:80];
                eid_dst[127:48] <= cdp2um_data[79:0];
                
                parser_state <= parser_udp;
            end
            parser_udp:
            begin
                case(ingress[2:0])
                  3'd0://ingress==1;
							begin
								 if({eid_dst[127:48],cdp2um_data[127:80]} != ip_src_1)	begin  //discard
										pkt_metadata_valid <= 1'b1;
                              pkt_metadata <= {4'b1000,356'b0};                           
                              pkt_head_valid <= 1'b1;
                              if((cdp2um_data[138:136] == 3'b110) || (cdp2um_data_valid == 1'b0))
                                begin
                                   pkt_head <={3'b110,cdp2um_data[135:0]};
                                   parser_state <= idle;
                                  end
                                  else
                                    begin
                                        pkt_head <= {3'b100,cdp2um_data[135:0]};
                                        parser_state <= trans_pkt_controller;
                                    end
									end 
									else	
										begin
											if((ip_protocol == 8'd17) && (cdp2um_data[63:48]==16'd4341))//lisp
                              begin
                                  parser_state <= parser_lisp_flag;
                                   p0_a_count	<=	p0_a_count +1'b1;
                                  pkt_head_valid <= 1'b1;
                                  pkt_head <= {3'b100,cdp2um_data[135:0]};
                                  
                                  pkt_metadata_valid <= 1'b0;
                                  metadata_parser[71:64] <= {2'b11,6'b0}; 
                              end
                            else//discard
                              begin
                                  pkt_metadata_valid <= 1'b1;
                                  pkt_metadata <= {4'b1000,356'b0};
                            
                                  pkt_head_valid <= 1'b1;
                                  if((cdp2um_data[138:136] == 3'b110) || (cdp2um_data_valid == 1'b0))
                                    begin
                                        pkt_head <={3'b110,cdp2um_data[135:0]};
                                        parser_state <= idle;
                                    end
                                  else
                                    begin
                                        pkt_head <= {3'b100,cdp2um_data[135:0]};
                                        parser_state <= trans_pkt_controller;
                                    end
                              end
											end
									
								end
                  default:
                  begin
                       
							 if({eid_dst[127:48],cdp2um_data[127:80]} == ip_src_match)
                        begin
                            pkt_metadata_valid <= 1'b1;
                            pkt_metadata <= {2'b01,358'b0};
                            pkt_head_valid <= 1'b1;
                            if((cdp2um_data[138:136] == 3'b110) || (cdp2um_data_valid == 1'b0))
                              begin
                                  pkt_head <={3'b110,cdp2um_data[135:0]};
                                  parser_state <= idle;
                              end
                            else
                              begin
                                  pkt_head <= {3'b100,cdp2um_data[135:0]};
                                  parser_state <= trans_pkt_controller;
                              end
                        end
                      else
                        begin
                            pkt_head_valid <= 1'b1;
                            if((cdp2um_data[138:136] == 3'b110) || (cdp2um_data_valid == 1'b0))
                              begin
                                  pkt_head <={3'b110,cdp2um_data[135:0]};
                                  pkt_metadata_valid <= 1'b1;
											 input_nobody_count	<=	input_nobody_count +1'b1;
                                  pkt_metadata <= {4'h1,4'b0,16'b0,ingress,rloc_src,eid_dst,metadata_parser};
                                  
                                  parser_state <= idle;
                              end
                            else
                              begin
                                  pkt_head <= {3'b110,cdp2um_data[135:0]};
											 input_count <= 8'd1 + input_count;
                                  parser_state <= trans_payload_notlisp;
                              end
                        end
                  end
                endcase
                
                
            end
            parser_lisp_flag:
            begin
                pkt_head <= {3'b100,cdp2um_data[135:0]};
                if(cdp2um_data[79:72] == 8'd1) //cut pkt marting 
                  begin
                     if(cdp2um_data[48] == 1'b1)//fragment--No.2 //FSN
                       begin
                          identify <= cdp2um_data[71:56]; //id
								  p0_b_count	<=	p0_b_count +1'b1;
                          pkt_metadata <= {4'b0,4'b1100,cdp2um_data[71:56],ingress,rloc_src,eid_dst,metadata_parser};
                       end
                     else//fragment-No.1
                       begin
                          identify <= cdp2um_data[71:56];
								  
                          pkt_metadata <= {4'b0,4'b1000,cdp2um_data[71:56],ingress,rloc_src,eid_dst,metadata_parser};
                       end
                  end
                else
                  begin
                      pkt_metadata <= {8'b0,16'b0,ingress,rloc_src,eid_dst,metadata_parser};
                  end
						
                parser_state <= parser_eth_2;
            end
            parser_eth_2:
            begin
                pkt_head_valid <= 1'b1;
                pkt_head <= {3'b100,cdp2um_data[135:0]};
                parser_state <= parser_eid_src;
            end
            parser_eid_src:
            begin
                pkt_head <= {3'b100,cdp2um_data[135:0]};
                parser_state <= parser_eid_dst;
            end
            parser_eid_dst:
            begin
                pkt_head_valid <= 1'b1;
                pkt_head <= {3'b100,cdp2um_data[135:0]};
                eid_dst[127:48] <= cdp2um_data[79:0];
                parser_state <= parser_udp_2;
            end
            parser_udp_2:
            begin
                pkt_head_valid <= 1'b1;
                pkt_metadata_valid <= 1'b1;
                eid_dst[47:0]	<= cdp2um_data[127:80];
                if(cdp2um_data[138:136]==3'b110)
                  begin
                      pkt_head <= {3'b110,cdp2um_data[135:0]};//head_tail;
                      parser_state <= idle;
                      pkt_metadata <= {4'h1,pkt_metadata[355:200],eid_dst[127:48],cdp2um_data[127:80],metadata_parser};
                  end					
                else
                  begin
                      pkt_head <= {3'b110,cdp2um_data[135:0]};//head_tail;
                      parser_state <= trans_payload;
                      pkt_metadata <= {4'h0,pkt_metadata[355:200],eid_dst[127:48],cdp2um_data[127:80],metadata_parser};
                  end
            end
            trans_payload_notlisp:
            begin
					 if(metadata_parser[31:16]>16'd1300) pkt_metadata <= {4'h2,4'b0,16'b0,ingress,rloc_src,eid_dst,metadata_parser};
                else pkt_metadata <= {8'b0,16'b0,ingress,rloc_src,eid_dst,metadata_parser};
											
                pkt_metadata_valid <= 1'b1;
                pkt_head_valid <= 1'b0;
                pkt_payload_valid <= 1'b1;
                if((cdp2um_data_valid == 1'b0) || (cdp2um_data[138:136] == 3'b110))
                  begin
                      parser_state <= idle;
                      pkt_payload <= {3'b110,cdp2um_data[135:0]};
                  end					 
                else
                  begin
                      parser_state <= trans_payload;
                      pkt_payload <= {3'b100,cdp2um_data[135:0]};
                  end
            end
            trans_payload:
            begin
                pkt_head_valid <= 1'b0;
                pkt_metadata_valid <= 1'b0;
                pkt_payload_valid <= 1'b1;
                if((cdp2um_data_valid == 1'b0) || (cdp2um_data[138:136] == 3'b110))
                  begin
                      parser_state <= idle;
                      pkt_payload <= {3'b110,cdp2um_data[135:0]};
                  end
                else
                  begin
                      parser_state <= trans_payload;
                      pkt_payload <= {3'b100,cdp2um_data[135:0]};
                  end
            end
            trans_pkt_controller:
            begin
                pkt_metadata_valid <= 1'b0;					
                if((cdp2um_data_valid == 1'b0) || (cdp2um_data[138:136] == 3'b110))					
                  begin						
                    parser_state <= idle;						
                    pkt_head <= {3'b110,cdp2um_data[135:0]};					
                  end					
                else					
                  begin						
                    parser_state <= trans_pkt_controller;						
                    pkt_head <= {3'b100,cdp2um_data[135:0]};					
                  end				
            end            
            discard:
            begin
                if(cdp2um_data[138:136] == 3'b110)  parser_state <= idle;
            end
            default:
            begin
                parser_state <= idle;
            end
          endcase
      end

//-------------------ip_src_set_state-------------------//
always @ (posedge clk or negedge reset)
if(!reset)	 begin
       //   ip_src_1 <= 128'b0;
	   ip_src_2 <= 128'b0;ip_src_3 <= 128'b0;ip_src_4 <= 128'b0;
       ip_src_5 <= 128'b0;ip_src_6 <= 128'b0;ip_src_7 <= 128'b0;ip_src_8 <= 128'b0;    
      end
    else
      begin
          if(ip_src_valid == 1'b1)
            begin
                case(ip_src[130:128])
                  3'd0: ip_src_1 <= ip_src[127:0];
                  3'd1: ip_src_2 <= ip_src[127:0];
                  3'd2: ip_src_3 <= ip_src[127:0];
                  3'd3: ip_src_4 <= ip_src[127:0];
                  3'd4: ip_src_5 <= ip_src[127:0];
                  3'd5: ip_src_6 <= ip_src[127:0];
                  3'd6: ip_src_7 <= ip_src[127:0];
                  3'd7: ip_src_8 <= ip_src[127:0];
                endcase
            end
          else ip_src_1 <= ip_src_1;
      end
endmodule


