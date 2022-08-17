module Lab2

using DataFrames, KernelDensity

"Returns a vector of strings with names of columns in DataFrame containing a variable of type."

function get_cols_containing_type(df::DataFrame, type::Type)
		filter(c->eltype(df[!,c])<:Union{Missing,type}, names(df) )
end

"Returns a vector of strings with names of columns in DataFrame containing some form of string."
get_cols_containing_string(df) = get_cols_containing_type(df,AbstractString)

"Returns a vector of strings with names of columns in DataFrame containing some form of real number."
get_cols_containing_real(df) = get_cols_containing_type(df,Real)


"""
`make_tap_query_url(base_url, query_table; ...)`

Returns url for a Table Access Protocol (TAP) query.

Inputs:
- base url 
- table name
Optional arguments:
- max_rows (all)
- select_cols (all)
- where (no requirement)
- order_by_cols (not sorted)
- format (tsv)

See [NExScI](https://exoplanetarchive.ipac.caltech.edu/docs/TAP/usingTAP.html#sync) or [Virtual Observatory](https://www.ivoa.net/documents/TAP/) for more info.
"""
function make_tap_query_url(query_base_url::String, query_table::String; max_rows::Integer = 0, select_cols::String = "", where::String = "", order_by_cols::String = "", format::String="tsv" )
	
	query_select = "select"
	if max_rows > 0 
		query_select *= "+top+" * string(max_rows)
	end
	if length(select_cols) >0
		query_select *= "+" * select_cols 
	else
		query_select *= "+*"
	end
	query_from = "+from+" * query_table
	query_where = length(where)>0 ? "+where+" * where : ""
	query_order_by = length(order_by_cols) > 0 ? "+order+by+" * order_by_cols : ""
	query_format = "&format=" * format
	url = query_base_url * query_select * query_from * query_where * query_order_by * query_format
end

"""
`calc_mask_points_outside_kde_contour(kde, x, y, level)`

Returns a binary mask indicating which points fall outside the level contour of a 2-d kernel density estimator.  Level is a fraction relative to the maximum of the pdf of the KDE.  
"""
function calc_mask_points_outside_kde_contour(kde::KernelDensity.AbstractKDE, x::AbstractVector{<:Real}, y::AbstractVector{<:Real}, level::Real)
	map((xx,yy)->pdf(kde,xx,yy)<level*maximum(kde.density), x, y)
end

end # module
