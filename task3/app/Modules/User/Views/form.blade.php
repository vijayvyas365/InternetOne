@extends('layouts.master')
@if(empty($data["info"]))
@section('title','User - Create' )
@else
@section('title','User - Edit' )
@endif
@section('breadcrumb')
<h4><i class="icon-arrow-left52 position-left"></i>User - @if(empty($data["info"])) Create @else Edit @endif</h4>
@stop
@section('quick_link')
<a href="{{ route('user.index') }}" class="btn btn-info btn-labeled" title="List"><b><i class="icon-list-unordered"></i></b>List</a>
@stop
@section('js')
<script type="text/javascript" src="{{ asset("public/assets/js/plugins/forms/styling/switch.min.js") }}"></script>
<script type="text/javascript" src="{{ asset("public/assets/js/plugins/forms/styling/switchery.min.js") }}"></script>
<script type="text/javascript" src="{!! asset('public/assets/ckeditor/ckeditor.js') !!}"></script>
@stop
@section('content')
<form class="form-validate-jquery"  action="{{URL::route("user.store")}}" method="post">
    <input type="hidden" name="_token" value="<?php echo csrf_token(); ?>" />
    <div class="panel panel-flat">
        <div class="panel-body">
            <div class="row">

                <div class="col-md-12">
                    <fieldset>
                        <legend class="text-semibold">User Detail</legend>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label required">First Name</label>
                                    <input maxlength="100" autocomplete="off" value="@if(!empty($data['info'])){{$data['info']->fname}}@endif" name="txtfname" id="txtfname" type="text" placeholder="First Name" class="form-control required">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label required">Last Name</label>
                                    <input maxlength="100" autocomplete="off" value="@if(!empty($data['info'])){{$data['info']->lname}}@endif" name="txtlname" id="txtlname" type="text" placeholder="Last Name" class="form-control required">
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label required">Email</label>
                                    <input maxlength="150" autocomplete="off" value="@if(!empty($data['info'])){{$data['info']->email}}@endif" name="txtemail" id="txtemail" type="email" placeholder="Email" class="form-control required">
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label required">Mobile No</label>
                                    <input maxlength="15" autocomplete="off" value="@if(!empty($data['info'])){{$data['info']->mobile_no}}@endif" name="txtmobile" id="txtmobile" type="text" placeholder="Mobile No" class="form-control required">
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label required">About You</label>
                                    <textarea placeholder="Write about you (max 255 character)" class="form-control required" name="txtaboutyou">@if(!empty($data['info'])){{$data['info']->about_you}}@endif</textarea>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label required">Country</label>
                                    <select name="country" >
                                        <option value="">Select Country</option>
                                        @foreach($data["country_list"] as $val)
                                        @if(!empty($data['info']) && $data['info']->country == $val->id)
                                            <option selected="" value="{{$val->id}}">{{$val->country_name}} (+{{$val->phonecode}})</option>
                                        @else
                                            <option value="{{$val->id}}">{{$val->country_name}} (+{{$val->phonecode}})</option>
                                        @endif
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label required">DOB</label>
                                    <input autocomplete="off" value="@if(!empty($data['info'])){{$data['info']->dob}}@endif" name="txtdob" id="txtdob" type="text" placeholder="Date Of Birth" class="form-control pickadate required">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label">Is Active ? </label>
                            <div class="checkbox checkbox-switch">
                                <label>
                                    <input name="status" id="status" value="1" type="checkbox" data-on-color="primary" data-off-color="danger" data-on-text="Active" data-off-text="Deactive" class="switch" checked="checked">
                                </label>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>

            <div class="text-right">
                <input type="hidden" name="id" id="id" value="{{$data["id"]}}" />
                <button type="button" class="btn btn-default" onclick="javascript:location.href ='{{URL::route("user.index")}}'">Cancel</button>
                <button type="submit" class="btn btn-primary">Save <i class="icon-arrow-right14 position-right"></i></button>
            </div>
        </div>
    </div>
</form>
@stop
@push("scripts")
<script>

$(document).ready(function () {
    $(".switch").bootstrapSwitch();
    
    @if(empty($data["info"]) || $data["info"]->status == 1)
       $('#status').bootstrapSwitch('state', true);
    @else
       $('#status').bootstrapSwitch('state', false);
    @endif

    $("select").select2();

    $(".form-validate-jquery").validate({
        focusInvalid: false, // do not focus the last invalid input
        ignore: "input[type=hidden], .select2-input",
        invalidHandler: function (event, validator) { //display error alert on form submit              
            $('.alert-danger').show();
            $('html, body').animate({
                scrollTop: $("body").offset().top
            }, 2000);
        },
        highlight: function (element) { // hightlight error inputs
            $(element).closest('.form-group').addClass('error'); // set error class to the control group
        },
        unhighlight: function (element) { // revert the change done by hightlight
            $(element).closest('.form-group').removeClass('error'); // set error class to the control group
        }
    });
    
    $('.pickadate').pickadate({
        format: 'yyyy-mm-dd',
        selectMonths: true,
        selectYears: true
    });
});

</script>
@endpush

