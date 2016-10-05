function vector_out=turn_vector(angle,vector_in)
global a N T v dt zor zoo zoa Bnds x y p q t A D
vector_out=[cos(angle) -sin(angle);sin(angle) cos(angle)]*vector_in;
