{**
 * templates/frontend/objects/monograph_summary.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display a summary view of a monograph for display in lists
 *
 * @uses $monograph Monograph The monograph to be displayed
 * @uses $isFeatured bool Is this a featured monograph?
 *}
<div class="obj_monograph_summary{if $isFeatured} is_featured{/if}">
	<a {if $press}href="{url press=$press->getPath() page="catalog" op="book" path=$monograph->getBestId()}"{else}href="{url page="catalog" op="book" path=$monograph->getBestId()}"{/if} class="cover">
		{assign var="coverImage" value=$monograph->getCurrentPublication()->getLocalizedData('coverImage')}
		<img
				src="{$monograph->getCurrentPublication()->getLocalizedCoverImageThumbnailUrl($monograph->getData('contextId'))}"
				alt="{$coverImage.altText|escape|default:''}"
		>
	</a>
	<!-- get series from SeriesDAO -->
	{$seriesDao = DAORegistry::getDAO('SeriesDAO')}
	{$series = $seriesDao->getById($monograph->getSeriesId())}

	{if $series}
		<div class="seriesName">
			<a href="{url page="catalog" op="series" path=$series->getPath()}">
				{$series->getLocalizedFullTitle()|escape}
			</a>
		</div>
	{/if}

	{if $monograph->getSeriesPosition()}
		<div class="seriesPosition">
			{$monograph->getSeriesPosition()|escape}
		</div>
	{/if}
	<{$heading} class="title">
	<a {if $press}href="{url press=$press->getPath() page="catalog" op="book" path=$monograph->getBestId()}"{else}href="{url page="catalog" op="book" path=$monograph->getBestId()}"{/if}>
		{$monograph->getLocalizedFullTitle()|escape}
	</a>
</{$heading}>
<div class="author">
	{$monograph->getAuthorOrEditorString()|escape}
</div>
<div class="date">
	{$monograph->getDatePublished()|date_format:$dateFormatLong}
</div>
</div><!-- .obj_monograph_summary -->
