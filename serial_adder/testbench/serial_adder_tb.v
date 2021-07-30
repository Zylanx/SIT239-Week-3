`timescale 1ns/1ns

module serial_adder_tb;
	// Inputs
	reg t_clk = 1'b0;
	reg t_reset = 1'b0;
	reg t_load = 1'b0;
	reg [2:0] t_x_data = 3'b101;
	reg [2:0] t_y_data = 3'b100;

	// Outputs
	wire [2:0] t_sum;
	wire t_carry;
	
	// Instantiate the Unit Under Test (UUT)
	serial_adder UUT (
		.i_clk(t_clk),
		.i_reset(t_reset),
		.i_load(t_load),
		.i_x_data(t_x_data),
		.i_y_data(t_y_data),
		.o_sum(t_sum),
		.o_carry(t_carry)
	);
	
	always #10 t_clk <= ~t_clk;

	initial begin
		$dumpfile("out.vcd");
		$dumpvars(1, serial_adder_tb);
		
		t_reset = 1;
		#10
		$display("x=%d, y=%d, sum=%d, carry=%d", t_x, t_y, t_sum, t_carry);
		#10
		
		t_reset = 0;
		#10
		$display("x=%d, y=%d, sum=%d, carry=%d", t_x, t_y, t_sum, t_carry);
		#10
		
		
		
		$stop;
	end

endmodule