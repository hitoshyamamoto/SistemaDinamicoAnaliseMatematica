%% Copyright (C) 2014-2016 Colin B. Macdonald
%%
%% This file is part of OctSymPy.
%%
%% OctSymPy is free software; you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published
%% by the Free Software Foundation; either version 3 of the License,
%% or (at your option) any later version.
%%
%% This software is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty
%% of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
%% the GNU General Public License for more details.
%%
%% You should have received a copy of the GNU General Public
%% License along with this software; see the file COPYING.
%% If not, see <http://www.gnu.org/licenses/>.

%% -*- texinfo -*-
%% @documentencoding UTF-8
%% @defmethod @@sym csc (@var{x})
%% Symbolic csc function.
%%
%% Example:
%% @example
%% @group
%% syms x
%% y = csc (x)
%%   @result{} y = (sym) csc(x)
%% @end group
%% @end example
%%
%% Note: this file is autogenerated: if you want to edit it, you might
%% want to make changes to 'generate_functions.py' instead.
%%
%% @end defmethod


function y = csc(x)
  if (nargin ~= 1)
    print_usage ();
  end
  y = elementwise_op ('csc', x);
end


%!error <Invalid> csc (sym(1), 2)
%!assert (isequaln (csc (sym(nan)), sym(nan)))

%!shared x, d
%! d = 1;
%! x = sym('1');

%!test
%! f1 = csc(x);
%! f2 = csc(d);
%! assert( abs(double(f1) - f2) < 1e-15 )

%!test
%! D = [d d; d d];
%! A = [x x; x x];
%! f1 = csc(A);
%! f2 = csc(D);
%! assert( all(all( abs(double(f1) - f2) < 1e-15 )))

%!test
%! % round trip
%! y = sym('y');
%! A = csc (d);
%! f = csc (y);
%! h = function_handle (f);
%! B = h (d);
%! assert (A, B, -eps)
