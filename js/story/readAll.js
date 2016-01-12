var ReadAll = {
	storyArr: null,
	rootSeq: null,
	
	init: function() {		
		this.rootSeq = $("#rootSeq").val();
		
		this.readStory(this.rootSeq);
	},
	
	readStory: function(rseq) {
		var oThis = this;
		
		$.ajax({
			type: "GET",
			dataType: "json",
			url: "/readStoryByAjax",
			data: { rseq: rseq },
			
			success: function(storyList) {				
				for(var i=0; i<storyList.length; i++) {					
					oThis.addStory(storyList[i]);
				}				
			}
		});			
	},
	
	addStory: function(storyObj) {
		$("#hiddenStoryBox").find("#title").text(storyObj.title);
		$("#hiddenStoryBox").find("#regId").text(storyObj.regId);
		$("#hiddenStoryBox").find("#regDt").text(storyObj.regDt);
		$("#hiddenStoryBox").find("#img").attr("src", "/img/story/"+storyObj.imgName);
		$("#hiddenStoryBox").find("#comment").text(storyObj.comment);
		
		$("#storiesBox").append($("#hiddenStoryBox").html());
	}
}