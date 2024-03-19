module ST (output oe_en, ow_en, on_en, os_en, Eject_en, 
           input e_req, w_req, n_req, s_req, eject_req, oe_f, ow_f, on_f, os_f, eject_f);
           

  and (oe_en, e_req, oe_f);
  and (ow_en, w_req, ow_f);
  and (on_en, n_req, on_f);
  and (os_en, s_req, os_f);
  and (Eject_en, eject_req, eject_f); 
  
endmodule