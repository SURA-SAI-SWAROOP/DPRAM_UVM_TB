class my_transaction extends uvm_sequence_item;
  `uvm_object_utils (my_transaction)
  
  bit reset;
  rand bit we;
  rand bit re;
  rand bit[3:0] waddr;
  rand bit[3:0] raddr;
  rand bit [7:0] data in;
  bit [7:0] data_out;
   
  function new(string name="my_transaction");
    super.new(name);
  endfunction

  virtual function void do_copy(uvm_object rhs);
    my_transaction tr:
    $cast(tr,rhs);
    super.do_copy (rhs);
    reset=tr.reset;
    we=tr.we;
    re=tr.re;
    waddr=tr.waddr;
    raddr=tr.raddr;
    data_in=tr.data_in;
    data_out=tr.data_out;
  endfunction
    
  function string convert2string();
    string s;
    s=$sformatf("reset=%0h we=%0h re=%0h waddr=%0h raddr=%0h data_in=%0h data_out=%0h",reset,we,re,waddr,raddr,data_in,data_out);
    return s;
  endfunction
    
  virtual function bit do_compare(uvm_object rhs, uvm_comparer comparer);
    bit res;
    my_transaction pkt;
    $cast(pkt,rhs);
    super.do_compare (pkt,comparer);
    res=super.do_compare(pkt,comparer)&(we==pkt.we)&(re==pkt.re)&(waddr==pkt.waddr)&(raddr==pkt.raddr)&(data_in==pkt.data_in)&(data_out==pkt.data_out);
    return res;
  endfunction
    
  function void do_print(uvm_printer printer);
    super.do_print(printer);
    printer.print_int("reset",reset,$bits(reset),UVM_HEX);
    printer.print_int("we",we,$bits(we),UVM_HEX);
    printer.print_int("re",re,$bits(re),UVM_HEX);
    printer.print_int("waddr",waddr,$bits(waddr),UVM_HEX);
    printer.print_int("raddr",raddr,$bits(raddr),UVM_HEX);
    printer.print_int("data_in",data_in,$bits(data_in),UVM_HEX);
    printer.print_int("data_out",data_out,$bits(data_out),UVM_HEX);
  endfunction
endclass
