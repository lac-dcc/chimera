//-------------------------------------------------------------------
//                                                                 
//  COPYRIGHT (C) 2011, VIPcore Group, Fudan University
//                                                                  
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE      
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//                                                                  
//  VIPcore       : http://soc.fudan.edu.cn/vip    
//  IP Owner 	  : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn             
//-------------------------------------------------------------------
// Filename       : cabac_mn_1p_16x64.v
// Author         : guo yong
// Created        : 2013-07
// Description    : cabac memory for modules
//               
//-------------------------------------------------------------------


module cabac_mn_1p_16x64(
				//input
				clk				,
							
				//output
				r_en			,
				r_addr			,
				r_data			



);

parameter ROM_NUM = 'd0;

// ********************************************
//                                             
//    INPUT / OUTPUT DECLARATION                            
//                                             
// ********************************************

input				clk						;	//clock signal
input				r_en					;	//read enable
input	[5:0]		r_addr					;	//read address of memory
                                        	
output	[15:0]		r_data					;	//read data from memory





// ********************************************
//                                             
//    Logic DECLARATION                 
//                                             
// ********************************************

`ifndef FPGA_MODEL

  rom_1p #(.Addr_Width(6), .Word_Width(16)) 	
  		rom_1p_16x64(
  				.clk     (clk		),
  				.cen_i   (~r_en		),
  				.oen_i   (~r_en		),
  				.addr_i  (r_addr	),
  				.data_o  (r_data	)
  );

`endif

`ifdef FPGA_MODEL

generate

if(ROM_NUM == 'd0) begin: g_rom0

rom64x16 #(
	.INIT_FILE	("rom0.mif"	)
	)rom_64x16_0(
	.address	(r_addr		),
	.clock		(clk		),
	.q			(r_data		)
);

end

else if(ROM_NUM == 'd1) begin: g_rom1

rom64x16 #(
	.INIT_FILE	("rom1.mif"	)
	)rom_64x16_1(
	.address	(r_addr		),
	.clock		(clk		),
	.q			(r_data		)
);

end

else if(ROM_NUM == 'd2) begin: g_rom2

rom64x16 #(
	.INIT_FILE	("rom2.mif"	)
	)rom_64x16_2(
	.address	(r_addr		),
	.clock		(clk		),
	.q			(r_data		)
);

end

else if(ROM_NUM == 'd3) begin: g_rom3

rom64x16 #(
	.INIT_FILE	("rom3.mif"	)
	)rom_64x16_3(
	.address	(r_addr		),
	.clock		(clk		),
	.q			(r_data		)
);

end


else if(ROM_NUM == 'd4) begin: g_rom4

rom64x16 #(
	.INIT_FILE	("rom4.mif"	)
	)rom_64x16_4(
	.address	(r_addr		),
	.clock		(clk		),
	.q			(r_data		)
);

end

endgenerate

`endif









endmodule




