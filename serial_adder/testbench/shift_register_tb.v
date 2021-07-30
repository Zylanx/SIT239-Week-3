`timescale 1ns/1ns

module shift_register_tb;
	// Inputs
	reg t_clk = 1'b0;

	// Outputs
	wire t_x;
	
	// Instantiate the Unit Under Test (UUT)
	shift_register #(3) UUT (
		.clk(t_clk),
		.enable(1'b1),
		.sr_in(),
		.sr_out(t_x)
	);
	
	always #5 t_clk <= ~t_clk;

	initial begin
		$dumpfile("out.vcd");
		$dumpvars(1, shift_register_tb);
		
		#10
		$display("t_x=%d", t_x);
		
		#10
		$display("t_x=%d", t_x);
		
		#10
		$display("t_x=%d", t_x);
		
		#10
		$display("t_x=%d", t_x);
		
		$stop;
	end

endmodule