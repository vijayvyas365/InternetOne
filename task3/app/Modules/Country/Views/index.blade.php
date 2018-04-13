@extends('layouts.master')
@section('title','Country' )
@section('breadcrumb')
<h4><i class="icon-arrow-left52 position-left"></i>Country - List</h4>
@stop
@section('content')
<div class="panel panel-flat">
    <div class="panel-body">
        <table id="table" class="table table-striped dataTable no-footer dtr-inline">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Country Name</th>
                    <th>Short Name</th>
                    <th>Phone Code</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>

</div>
@stop
@push("scripts")
<script type="text/javascript">
    
    $(document).ready(function () {
        $('#table').DataTable({
            autoWidth: false,
            bSearchable: false,
            processing: true,
            responsive: true,
            serverside: true,
            ajax: '{{route('country.index')}}',
            columnDefs: [
                {
                    width: '6%',
                    targets: 0,
                    data: 'id'
                },
                {
                    width: '20%',
                    targets: 1,
                    data: 'country_name'
                },
                {
                    width: '15%',
                    targets: 2,
                    data: 'sortname'
                },
                {
                    width: '15%',
                    targets: 3,
                    data: 'phonecode'
                },
                {
                    targets: 4,
                    data: 'status',
                    width: '10%',
                }
            ],
            lengthMenu: [15, 25, 50, 75, 100],
            displayLength: 15,
            order: [[ 1, "asc" ]],
            dom: '<"datatable-header"fl><"datatable-scroll-lg"t><"datatable-footer"ip>'

        });

        $('.dataTables_length select').select2({
             minimumResultsForSearch: "-1",
            width: 'auto'
        });
    });

</script>
@endpush

