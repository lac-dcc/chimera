// This program was cloned from: https://github.com/Asiadav/OpenPBKDF2
// License: MIT License

`ifndef BSG_MANYCORE_PKG_V
`define BSG_MANYCORE_PKG_V

package bsg_manycore_1x1_pkg;

   // for both bsg_test_node_master and bsg_test_node_client
   parameter bank_size_gp          = 1024; // in words
   parameter bank_num_gp           = 1;    // number of banks
   parameter imem_size_gp          = 1024; // in words (e.g. instructions)
   parameter addr_width_gp         = 20;
   parameter data_width_gp         = 32;
   parameter hetero_type_vec_gp    = 0;
   parameter fsb_remote_credits_gp = 128;

   // manycore topography
   parameter num_tiles_x_gp = 1;
   parameter num_tiles_y_gp = 1;

   // for bsg_test_node_master
   parameter tile_id_ptr_gp  = -1;
   parameter max_cycles_gp   = 1000000;
   parameter mem_size_gp     = (bank_num_gp*bank_size_gp+imem_size_gp)*4;

endpackage // bsg_manycore_1x1_pkg

`endif // BSG_MANYCORE_PKG_V
