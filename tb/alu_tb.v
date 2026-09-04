// testbench for ALU
// tests Add, Sub, AND, OR operations + one overflow case

module testbench;

  reg [7:0] a_tb;
  reg [7:0] b_tb;
  reg [1:0] sel_tb;
  wire [7:0] result_tb;
  wire cout_tb;

  alu my_alu (
    .a(a_tb),
    .b(b_tb),
    .sel(sel_tb),
    .result(result_tb),
    .cout(cout_tb)
  );

  initial begin
    // test 1: Add
    a_tb = 5;
    b_tb = 3;
    sel_tb = 2'b00;
    #5 $display("a=%d, b=%d, sel=%b, result=%d, cout=%d", a_tb, b_tb, sel_tb, result_tb, cout_tb);

    // test 2: Sub
    a_tb = 10;
    b_tb = 4;
    sel_tb = 2'b01;
    #5 $display("a=%d, b=%d, sel=%b, result=%d, cout=%d", a_tb, b_tb, sel_tb, result_tb, cout_tb);

    // test 3: AND
    a_tb = 12;
    b_tb = 10;
    sel_tb = 2'b10;
    #5 $display("a=%d, b=%d, sel=%b, result=%d, cout=%d", a_tb, b_tb, sel_tb, result_tb, cout_tb);

    // test 4: OR
    a_tb = 12;
    b_tb = 10;
    sel_tb = 2'b11;
    #5 $display("a=%d, b=%d, sel=%b, result=%d, cout=%d", a_tb, b_tb, sel_tb, result_tb, cout_tb);

    // test 5: Add overflow case, cout should be 1
    a_tb = 200;
    b_tb = 100;
    sel_tb = 2'b00;
    #5 $display("a=%d, b=%d, sel=%b, result=%d, cout=%d", a_tb, b_tb, sel_tb, result_tb, cout_tb);

  end

endmodule
