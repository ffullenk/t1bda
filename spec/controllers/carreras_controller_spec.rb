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

describe CarrerasController do

  # This should return the minimal set of attributes required to create a valid
  # Carrera. As you add validations to Carrera, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "nombre" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CarrerasController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all carreras as @carreras" do
      carrera = Carrera.create! valid_attributes
      get :index, {}, valid_session
      assigns(:carreras).should eq([carrera])
    end
  end

  describe "GET show" do
    it "assigns the requested carrera as @carrera" do
      carrera = Carrera.create! valid_attributes
      get :show, {:id => carrera.to_param}, valid_session
      assigns(:carrera).should eq(carrera)
    end
  end

  describe "GET new" do
    it "assigns a new carrera as @carrera" do
      get :new, {}, valid_session
      assigns(:carrera).should be_a_new(Carrera)
    end
  end

  describe "GET edit" do
    it "assigns the requested carrera as @carrera" do
      carrera = Carrera.create! valid_attributes
      get :edit, {:id => carrera.to_param}, valid_session
      assigns(:carrera).should eq(carrera)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Carrera" do
        expect {
          post :create, {:carrera => valid_attributes}, valid_session
        }.to change(Carrera, :count).by(1)
      end

      it "assigns a newly created carrera as @carrera" do
        post :create, {:carrera => valid_attributes}, valid_session
        assigns(:carrera).should be_a(Carrera)
        assigns(:carrera).should be_persisted
      end

      it "redirects to the created carrera" do
        post :create, {:carrera => valid_attributes}, valid_session
        response.should redirect_to(Carrera.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved carrera as @carrera" do
        # Trigger the behavior that occurs when invalid params are submitted
        Carrera.any_instance.stub(:save).and_return(false)
        post :create, {:carrera => { "nombre" => "invalid value" }}, valid_session
        assigns(:carrera).should be_a_new(Carrera)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Carrera.any_instance.stub(:save).and_return(false)
        post :create, {:carrera => { "nombre" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested carrera" do
        carrera = Carrera.create! valid_attributes
        # Assuming there are no other carreras in the database, this
        # specifies that the Carrera created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Carrera.any_instance.should_receive(:update_attributes).with({ "nombre" => "MyString" })
        put :update, {:id => carrera.to_param, :carrera => { "nombre" => "MyString" }}, valid_session
      end

      it "assigns the requested carrera as @carrera" do
        carrera = Carrera.create! valid_attributes
        put :update, {:id => carrera.to_param, :carrera => valid_attributes}, valid_session
        assigns(:carrera).should eq(carrera)
      end

      it "redirects to the carrera" do
        carrera = Carrera.create! valid_attributes
        put :update, {:id => carrera.to_param, :carrera => valid_attributes}, valid_session
        response.should redirect_to(carrera)
      end
    end

    describe "with invalid params" do
      it "assigns the carrera as @carrera" do
        carrera = Carrera.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Carrera.any_instance.stub(:save).and_return(false)
        put :update, {:id => carrera.to_param, :carrera => { "nombre" => "invalid value" }}, valid_session
        assigns(:carrera).should eq(carrera)
      end

      it "re-renders the 'edit' template" do
        carrera = Carrera.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Carrera.any_instance.stub(:save).and_return(false)
        put :update, {:id => carrera.to_param, :carrera => { "nombre" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested carrera" do
      carrera = Carrera.create! valid_attributes
      expect {
        delete :destroy, {:id => carrera.to_param}, valid_session
      }.to change(Carrera, :count).by(-1)
    end

    it "redirects to the carreras list" do
      carrera = Carrera.create! valid_attributes
      delete :destroy, {:id => carrera.to_param}, valid_session
      response.should redirect_to(carreras_url)
    end
  end

end
