@extends('layouts.display')
@section('title','User - View' )
@section('breadcrumb')
<h4><i class="icon-arrow-left52 position-left"></i>User - View</h4>
@stop
@section('quick_link')
<a href="{{ route('user.create') }}" class="btn bg-primary-400 btn-labeled" title="Add New"><b><i class="icon-plus2"></i></b>Add New</a>
<a href="{{ route('user.index') }}" class="btn btn-info btn-labeled" title="List"><b><i class="icon-list-unordered"></i></b>List</a>
<a href="{{ route('user.edit', $data["info"]->id) }}" class="btn bg-slate-400 btn-labeled" title="Edit"><b><i class="icon-pencil"></i></b>Edit</a>
@stop
@section('content')
<div class="row general-edit">
    <div class="col-lg-12">
        <!-- Task overview -->
        <div class="panel panel-white">
            <div class="panel-heading mt-5">
                <h5 class="panel-title"><i class="icon-info22"></i> Personal Information</h5>
            </div>
            <div class="panel-body">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="name" class="col-md-3 text-bold">Name</label>
                        <label>{{$data["info"]->fname}} {{$data["info"]->lname}}</label>
                    </div>
                    
                    <div class="form-group">
                        <label for="name" class="col-md-3 text-bold">Country</label>
                        <label>{{ucfirst($data["info"]->countries->country_name)}}</label>
                    </div>
                    
                    <div class="form-group">
                        <label for="name" class="col-md-3 text-bold">Created By</label>
                        <label>{{ucfirst($data["info"]->admin->fname)}} {{ucfirst($data["info"]->admin->lname)}}</label>
                    </div>
                    
                    <div class="form-group">
                        <label for="name" class="col-md-3 text-bold">Is Active?</label>
                        <label>
                            @if($data["info"]->status == 1)
                            <label class="label bg-success-600">Active</label>
                            @else
                            <label class="label bg-danger-600">Deactive</label>
                            @endif
                        </label>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="name" class="col-md-3 text-bold">Email</label>
                        <label>{{$data["info"]->email}}</label>
                    </div>

                    <div class="form-group">
                        <label for="name" class="col-md-3 text-bold">Mobile No</label>
                        <label>{{ucfirst($data["info"]->mobile_no)}}</label>
                    </div>

                    <div class="form-group">
                        <label for="name" class="col-md-3 text-bold">Created At</label>
                        <label>{{date("d F, Y",strtotime($data["info"]->created_at))}}</label>
                    </div>
                    
                    <div class="form-group">
                        <label for="name" class="col-md-3 text-bold">Date of Birth</label>
                        <label>{{date("d F, Y",strtotime($data["info"]->dob))}}</label>
                    </div>
                </div>


            </div>
        </div>
        
        
        
        <div class="panel panel-white">
            <div class="panel-heading mt-5">
                <h5 class="panel-title"><i class="icon-user"></i> About <span style="font-style: italic;">"{{$data["info"]->fname}}"</span></h5>
            </div>
            <div class="panel-body">
                <div class="col-md-6">
                    {{$data["info"]->about_you}}
                </div>


            </div>
            
        </div>
        <a href="{{URL::route("user.index")}}" class="btn btn-default" style="float: right;" title="List">Back </a>
    </div>
</div>
@stop


