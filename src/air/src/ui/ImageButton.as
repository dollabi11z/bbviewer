package ui
{
    import spark.components.Button;
	
	 [Style(name="image",type="*")]  
	 [Style(name="imageDisabled",type="*")]  
	 [Style(name="imageDown",type="*")]  
	 [Style(name = "imageOver", type = "*")]  
	 
    public class ImageButton extends Button
    {
        public function ImageButton()
        {
            super();
			this.buttonMode = true;
        }
    }
}