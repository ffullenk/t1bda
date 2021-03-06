require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SedesController do

  # This should return the minimal set of attributes required to create a valid
  # Sede. As you add validations to Sede, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "nombre" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SedesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all sedes as @sedes" do
      sede = Sede.create! valid_attributes
      get :index, {}, valid_session
      assigns(:sedes).should eq([sede])
    end
  end

  describe "GET show" do
    it "assigns the requested sede as @sede" do
      sede = Sede.create! valid_attributes
      get :show, {:id => sede.to_param}, valid_session
      assigns(:sede).should eq(sede)
    end
  end

  describe "GET new" do
    it "assigns a new sede as @sede" do
      get :new, {}, valid_session
      assigns(:sede).should be_a_new(Sede)
    end
  end

  describe "GET edit" do
    it "assigns the requested sede as @sede" do
      sede = Sede.create! valid_attributes
      get :edit, {:id => sede.to_param}, valid_session
      assigns(:sede).should eq(sede)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Sede" do
        expect {
          post :create, {:sede => valid_attributes}, valid_session
        }.to change(Sede, :count).by(1)
      end

      it "assigns a newly created sede as @sede" do
        post :create, {:sede => valid_attributes}, valid_session
        assigns(:sede).should be_a(Sede)
        assigns(:sede).should be_persisted
      end

      it "redirects to the created sede" do
        post :create, {:sede => valid_attributes}, valid_session
        response.should redirect_to(Sede.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sede as @sede" do
        # Trigger the behavior that occurs when invalid params are submitted
        Sede.any_instance.stub(:save).and_return(false)
        post :create, {:sede => { "nombre" => "invalid value" }}, valid_session
        assigns(:sede).should be_a_new(Sede)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Sede.any_instance.stub(:save).and_return(false)
        post :create, {:sede => { "nombre" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sede" do
        sede = Sede.create! valid_attributes
        # Assuming there are no other sedes in the database, this
        # specifies that the Sede created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Sede.any_instance.should_receive(:update_attributes).with({ "nombre" => "MyString" })
        put :update, {:id => sede.to_param, :sede => { "nombre" => "MyString" }}, valid_session
      end

      it "assigns the requested sede as @sede" do
        sede = Sede.create! valid_attributes
        put :update, {:id => sede.to_param, :sede => valid_attributes}, valid_session
        assigns(:sede).should eq(sede)
      end

      it "redirects to the sede" do
        sede = Sede.create! valid_attributes
        put :update, {:id => sede.to_param, :sede => valid_attributes}, valid_session
        response.should redirect_to(sede)
      end
    end

    describe "with invalid params" do
      it "assigns the sede as @sede" do
        sede = Sede.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Sede.any_instance.stub(:save).and_return(false)
        put :update, {:id => sede.to_param, :sede => { "nombre" => "invalid value" }}, valid_session
        assigns(:sede).should eq(sede)
      end

      it "re-renders the 'edit' template" do
        sede = Sede.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Sede.any_instance.stub(:save).and_return(false)
        put :update, {:id => sede.to_param, :sede => { "nombre" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sede" do
      sede = Sede.create! valid_attributes
      expect {
        delete :destroy, {:id => sede.to_param}, valid_session
      }.to change(Sede, :count).by(-1)
    end

    it "redirects to the sedes list" do
      sede = Sede.create! valid_attributes
      delete :destroy, {:id => sede.to_param}, valid_session
      response.should redirect_to(sedes_url)
    end
  end

end
