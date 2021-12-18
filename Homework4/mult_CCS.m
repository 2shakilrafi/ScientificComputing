function product = mult_CCS(val, row_ind, col_ptr,x)
% this is a function tto calculater the product of a matrix and and a column vector x where the matrix
% is stored in CCS format

n = max(row_ind);                                           % we assume we are working with a square matrix and n is initialized
product = zeros(n,1);                                       % the product is initialized to zero
A = [];                                                     % we reconstruct A, by first initializing to an empty matrix
for i = 1:n                                                 % we will reconstruct column by column
    columni = zeros(n,1);                                   % the first column is assumed to be zero
    columnvals = val(col_ptr(i):col_ptr(i+1)-1);            % the column values are extracted from val by choosing between col_ptr(i) and col_ptr(i+1)-1
    columnpos = row_ind(col_ptr(i):col_ptr(i+1)-1);         % we insert the column vals according to the row indices
    columni(columnpos) = columnvals;                        % we have reconstructed a column
    A = [A columni];                                        % A is A horcat with a column
end

product = A*x;                                              % the product is the usual produc

end